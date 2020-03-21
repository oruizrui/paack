require 'net/http'
require 'uri'

class Weather::ElTiempo::ApiCall < Mutations::Command

  BASE_URI = 'http://api.tiempo.com/index.php'
  AFFILIATE_ID = '1k29jcz9flvv'

  required do
    integer :localidad, class: Integer
  end

  optional do
    string :api_lang, default: 'es'
    string :v, default: '3.0'
  end

  def execute
    uri = URI(base_uri)
    uri.query = URI.encode_www_form(params)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)

    http.request(request)
  end

  private

  def base_uri
    BASE_URI
  end

  def params
    base_params.merge!(inputs)
  end

  def base_params
    {
        affiliate_id: affiliate_id
    }
  end

  def affiliate_id
    AFFILIATE_ID
  end
end
