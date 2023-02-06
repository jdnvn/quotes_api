require 'base64'
require 'json'
require 'net/https'

module Clients
  class Google
    API_KEY = ENV['GOOGLE_VISION_API_KEY']

    def initialize(bytes:)
      @bytes = bytes
      @url = "https://vision.googleapis.com/v1/images:annotate?key=#{API_KEY}"
    end

    def process
      @client.annotate_image(requests)
    end

    def request
      uri = URI.parse(@url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request["Content-Type"] = "application/json"
      response = https.request(request, body.to_json)
    end

    private

    def body
      @body ||=
        {
          requests: [{
            image: {
              content: file_bytes
            },
            features: [
              {
                type: 'TEXT_DETECTION', # Details are below.
                maxResults: 1 # The number of results you would like to get
              }
            ]
          }]
        }
    end

    def feature
      @feature ||= Vision::Feature.new(
        type: "TEXT_DETECTION",
        max_results: 1
      )
    end

    def image
      @image ||= Vision::Image.new(content: file_bytes)
    end

    def file_bytes
      Base64.strict_encode64(Base64.decode64(@bytes))
    end

    def requests
      @requests ||= Vision::BatchAnnotateImagesRequest.new(
        requests: [
          Vision::AnnotateImageRequest.new(
            image:    image,
            features: [feature]
          )
        ]
      )
    end
  end
end
