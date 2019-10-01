class Reading < ApplicationRecord
  belongs_to :thermostat

  validates :temperature, :humidity, :battery_charge, :thermostat_id,  presence: true, numericality: true
  validates :tracking_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, uniqueness: { scope: :thermostat_id }

  after_create :delete_cached_data

  private

  def delete_cached_data
  	$redis.del(thermostat.cache_key(tracking_number))
  end
end
