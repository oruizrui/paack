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

      success = http.request(request)

      {
          code: success.code,
          boby: success.body
      }
    end
  end
end
