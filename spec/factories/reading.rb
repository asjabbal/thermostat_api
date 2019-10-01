FactoryBot.define do
  factory :reading do
    association :thermostat, factory: :thermostat

    tracking_number { 1 }
    temperature { Faker::Number.decimal(l_digits: 4.3) }
    humidity { Faker::Number.decimal(l_digits: 3.2) }
    battery_charge { Faker::Number.decimal(l_digits: 5.5) }
  end
end