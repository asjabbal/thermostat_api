# Tools/Libs Dependencies
- MySQL >=5.7.27
- Redis >=3.0.6
- Ruby 2.6.0
- Rails 5.2.3

# How to run the app
- make sure you have mysql aand redis servers running on localhost
- git clone repo
- cd to app dir and run `bundle install` in terminal
- now run `rake db:drop db:create db:migrate db:seed --trace`
- open same dir in new terminal and run sidekiq server by `sidekiq -q default`
- execute below APIs for outputs through curl or postman

# Three APIs (All Return JSON)
#### First: Create Readings
- Api endpoint: */api/v1/readings*
- Method: *Post*
- Params required: *temperature, humidity, battery_charge*
- Headers required: *X-Household-Token*
- Returns: *reading tracking number*
- Example return: 
```json
{ "data": {"tracking_number": 1} }
```

#### Second: Read Readings by Tracking number for a Thermostat
- Api endpoint: */api/v1/readings/<tracking_number>*
- Method: *Get*
- Params required: *tracking_number*
- Headers required: *X-Household-Token*
- Returns: *returns thermostat reading data*
- Example return: 
```json
{
    "data": {
        "tracking_number": 6,
        "temperature": 30.5,
        "humidity": 60.8,
        "battery_charge": 40.2
    }
}
```

#### Third: Get Thermostat stats
- Api endpoint: */api/v1/thermostats/stats*
- Method: *Get*
- Headers required: *X-Household-Token*
- Returns: *thermostat stats data*
- Example return:
```json
{
    "data": {
        "temperature": {
            "avg": 30.5,
            "min": 30.5,
            "max": 30.5
        },
        "humidity": {
            "avg": 60.79999923706055,
            "min": 60.79999923706055,
            "max": 60.79999923706055
        },
        "battery_charge": {
            "avg": 40.20000076293945,
            "min": 40.20000076293945,
            "max": 40.20000076293945
        }
    }
}
```

# RSpec Test Cases
Run `rspec` to run test cases. Not all test cases have been covered.