# Umbrella
require "http"
require "json"

GMAPS_KEY = ENV['GMAPS_KEY']
PIRATE_WEATHER_KEY = ENV['PIRATE_WEATHER_KEY']

puts GMAPS_KEY
puts PIRATE_WEATHER_KEY


puts "Where ya at?"
location = gets.chomp

# Now you can use the variable 'location' to access the user's input
puts "You entered: #{location}"

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{GMAPS_KEY}"

raw_gmaps_data = HTTP.get(gmaps_url)
parsed_gmaps_data = JSON.parse(raw_gmaps_data)

results_array = parsed_gmaps_data.fetch("results")

first_result_hash = results_array.at(0)
geometry_hash = first_result_hash.fetch("geometry")
location_hash = geometry_hash.fetch("location")
latitude = location_hash.fetch("lat")
longitude = location_hash.fetch("lng")

puts "Your coordinates are #{latitude}, #{longitude}."

# Get the weather from Pirate Weather API
#pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_weather_url = "https://api.pirateweather.net/forecast/#{PIRATE_WEATHER_KEY}/#{latitude},#{longitude}"

raw_pirate_weather_data = HTTP.get(pirate_weather_url)
parsed_weather_data = JSON.parse(raw_pirate_weather_data)

currently_hash = parsed_weather_data.fetch("currently")
temperature_hash = currently_hash.fetch("temperature")

puts "The current temperature is #{temperature_hash}"

# Some locations around the world do not come with minutely data.
minutely_hash = parsed_weather_data.fetch("minutely", false)

if minutely_hash
  next_hour_summary = minutely_hash.fetch("summary")

  puts "Next hour: #{next_hour_summary}"
end

hourly_hash = parsed_weather_data.fetch("hourly")
hourly_data_array = hourly_hash.fetch("data")

#next_twelve_hours = hourly_data_array[1..12]
puts hourly_data_array = hourly_hash.fetch("data")

