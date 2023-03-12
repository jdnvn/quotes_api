# unrelated code for other side project

require 'net/http'

task :ping_door_man => [ :environment ] do
  url = URI.parse('http://pienet.servebeer.com/ping')
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url.request_uri)
  response = http.request(request)
end
