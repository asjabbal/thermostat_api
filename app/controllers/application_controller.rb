class ApplicationController < ActionController::API
  before_action :authorize_thermostat

  def routing_error
     render json: {message: 'Oops! Invalid route.'}, status: 404
  end

  private

  def authorize_thermostat
    begin
      @thermostat = Thermostat.find_by(household_token: request.headers['X-Household-Token'])

      render json: { message:  'Thermostat not found! Invalid HouseholdToken.'}, status: 404 if @thermostat.nil?
    rescue
      render json: { errors:  'Bad Request!'}, status: 400
    end
  end

end
