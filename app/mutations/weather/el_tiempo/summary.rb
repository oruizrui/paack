class Weather::ElTiempo::Summary < Mutations::Command

  required do
    array :tempmaxs
    array :tempmins
    hash :today do
      array :tempmaxs
      array :tempmins
    end
  end


end
