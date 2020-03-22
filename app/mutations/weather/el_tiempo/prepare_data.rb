class Weather::ElTiempo::PrepareData < Mutations::Command

  required do
    integer :status, in: [0, 1]
  end

  optional do
    string :location
    string :url
    hash :day do
      required do
        hash :"1" do
          required do
            integer :tempmin
            integer :tempmax
          end
        end
        hash :"2" do
          required do
            integer :tempmin
            integer :tempmax
          end
        end
        hash :"3" do
          required do
            integer :tempmin
            integer :tempmax
          end
        end
        hash :"4" do
          required do
            integer :tempmin
            integer :tempmax
          end
        end
        hash :"5" do
          required do
            integer :tempmin
            integer :tempmax
          end
        end
      end
    end

    string :error
  end

  #def validate
  #  check_status
  #  check_error
  #end

  def execute
    #debugger
  end



end
