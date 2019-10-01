class Thermostat < ApplicationRecord
  has_many :readings, dependent: :destroy

  validates :household_token, presence: true, uniqueness: true
  validates :location, presence: true

  def new_reading_tracking_number
    (readings.maximum(:tracking_number) || 0) + 1
  end

  def cache_key(reading_tracking_number)
    "th_#{id}_rtn_#{reading_tracking_number}"
  end

  def stats
    count = 0
    data = {}
    query = []

    %w(temperature humidity battery_charge).each{|metric|
      data[metric] ||= {}

      %w(avg min max).each{|stat|
        data[metric][stat] = count
        query << "#{stat}(#{metric})"
        count += 1
      }
    }

    result = readings.pluck(Arel.sql(query.join(","))).first

    data.each{|metric, stats|
      stats.each{|stat, value|
        data[metric][stat] = result[value] 
      }
    }
    
    data
  end

end
