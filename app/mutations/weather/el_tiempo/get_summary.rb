class Weather::ElTiempo::GetSummary < Mutations::Command

  required do
    integer :localidad
  end

  def execute
    Weather::ElTiempo::ApiCall.run!(localidad: localidad).
        then{ |scope| Weather::ElTiempo::ApiCallback.run!(scope) }.
        then{ |scope| Weather::ElTiempo::PrepareData.run!(scope) }.
        then{ |scope| Weather::ElTiempo::Summary.run!(scope) }
  end

end
