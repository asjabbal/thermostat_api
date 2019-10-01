require 'rails_helper'

RSpec.describe Thermostat do

  describe 'associations' do
    it { should have_many(:readings) }
  end

  describe 'validations' do
    it { should validate_presence_of(:household_token) }
    it { should validate_uniqueness_of(:household_token) }
    it { should validate_presence_of(:location) }

    it "invalidates without a household_token" do
      expect(build(:thermostat, household_token: nil)).to_not be_valid
    end

    it "invalidates without a location" do
      expect(build(:thermostat, location: nil)).to_not be_valid
    end

  end

end