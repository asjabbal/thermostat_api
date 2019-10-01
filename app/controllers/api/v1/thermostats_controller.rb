class Api::V1::ThermostatsController < ApplicationController

  def stats
    render json: { data: @thermostat.stats }, status: 200
  end

end