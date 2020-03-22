Weather::ElTiempo::ApiParseTemperatures.run!(body: JSON.parse(json.body, {:symbolize_names => true}))
class Weather::ElTiempo::ApiParseTemperatures < Mutations::Command

  WEEK_DAYS = %W[1 2 3 4 5 6 7]

  required do
    hash :body
  end

  def execute
    days.each_with_object(obj) do |day, hash|
      add_to_hash(hash, day)
      if str === '1'
        add_to_hash(hash[:today], day)
      end
    end
  end

  private

  def days
    WEEK_DAYS
  end

  def obj
    {
        min: [],
        max: [],
        today: {
            min: [],
            max: []
        }
    }
  end

  def add_to_hash(hash, day)
    hash[:min] << temperature(day, :tempmin)
    hash[:max] << temperature(day, :tempmax)
  end

  def temperature(day, key)
    body[:day][:"#{day}"][key].to_i
  end
end
