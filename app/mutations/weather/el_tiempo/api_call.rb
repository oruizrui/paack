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
    Paack::Request.
        request(
            base_uri: base_uri,
            params: params
        )
  end

  arr = %w[1 2 3 4 5]
  JSON.parse(json.body, {:symbolize_names => true})[:day]; nil
  obj = {
      min: [],
      max: [],
      today: ''
  }
  arr.each_with_object(obj) do |str, hash|
    hash[:min] << JSON.parse(json.body, {:symbolize_names => true})[:day][:"#{str}"][:tempmin].to_i
    hash[:max] << JSON.parse(json.body, {:symbolize_names => true})[:day][:"#{str}"][:tempmax].to_i
  end

  private

  def base_uri
    BASE_URI
  end

  def params
    base_params.
        merge!(inputs).
        symbolize_keys
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
