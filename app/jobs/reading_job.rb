class ReadingJob < ApplicationJob
  queue_as :default

  def perform(thermostat, params)
  	begin
  		reading = thermostat.readings.new(params)
    	reading.save!
  	rescue Exception => e
  		puts e.message
  	end
  end

end
