FactoryBot.define do
  factory :thermostat do
    household_token { Faker::Lorem.characters(number: 10) }
    location { Faker::Address.full_address }
  end
end