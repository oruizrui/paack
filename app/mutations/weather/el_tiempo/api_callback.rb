class Weather::ElTiempo::ApiCallback < Mutations::Command

  required do
    integer :code, class: Integer
    hash :body
  end

  def validate
    code_validations
  end

  def execute
    parsed_body
  end

  private

  def parsed_body
    JSON.parse(body, {:symbolize_names => true})
  end

end
