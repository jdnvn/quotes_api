module Highlights
  class Ocr < Base
    def initialize(bytes:)
      @bytes = bytes
    end

    def call
      response = Clients::Google.new(bytes: @bytes).request
      return failure('something went wrong with request') unless response.code == '200'

      body = JSON.parse(response.body)
      text = body["responses"][0]["fullTextAnnotation"]["text"]

      success(text)
    rescue StandardError => e
      failure("Could not read image")
    end
  end
end
