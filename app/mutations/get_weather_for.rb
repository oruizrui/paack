class GetWeatherFor < Mutations::Command

  required do
    integer :city_id
  end

  def execute
    Weather::ElTiempo::ApiCall.run!(localidad: city_id).
        then{ |scope| CleanResponse.run!(scope) }.
        then{ |scope|  }
  end

end
