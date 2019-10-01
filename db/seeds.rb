10.times do
  Thermostat.create(
      household_token: Faker::Lorem.characters(number: 10),
      location:  Faker::Address.full_address
  )
end