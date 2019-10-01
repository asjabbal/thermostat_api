require 'rails_helper'

RSpec.describe Api::V1::ThermostatsController do
  describe 'GET stats' do
    let!(:thermostat) { create(:thermostat) }

    it 'returns 404 with no token' do
      get :stats
      expect(response).to have_http_status(404)
    end

    it 'returns 404 with invalid token' do
      request.headers.merge!({ 'X-Household-Token' => "token" })
      get :stats
      expect(response).to have_http_status(404)
    end

    it 'returns 200 with valid token' do
      request.headers.merge!({ 'X-Household-Token' => thermostat.household_token })
      get :stats
      expect(response).to have_http_status(200)
    end
  end
end