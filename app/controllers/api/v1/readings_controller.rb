class Api::V1::ReadingsController < ApplicationController
  before_action :load_reading, only: [:show]
  before_action :generate_new_tracking_number, only: [:create]

  def create
    $redis.set(cache_key, reading_params.to_json)
    # ReadingJob.set(wait: 3.minute).perform_later(@thermostat, reading_params)
    ReadingJob.perform_later(@thermostat, reading_params)

    render json: { data: {tracking_number: params[:tracking_number]} }, status: 200
  end

  def show
    render json: { data: @reading }, status: 200
  end


  private

  def load_reading
    @reading = @thermostat.readings.where(tracking_number: params[:tracking_number]).first || JSON.parse($redis.get(cache_key))
  end

  def generate_new_tracking_number
    params[:tracking_number] = @thermostat.new_reading_tracking_number
  end

  def reading_params
    params.permit(:temperature, :humidity, :battery_charge, :tracking_number)
  end

  def cache_key
    @thermostat.cache_key(params[:tracking_number])
  end
end