require 'net/http'
require 'uri'

module Paack
  class Request
    def self.request(base_uri:, params: nil)
      uri = URI(base_uri)

      unless params.nil?
        uri.query = URI.encode_www_form(params)
      end

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)

      http.request(request)
    end
  end
end
