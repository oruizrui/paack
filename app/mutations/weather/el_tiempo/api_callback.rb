class Weather::ElTiempo::Callback < Mutations::Command

  required do
    integer :code, class: Integer
    json :body
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
