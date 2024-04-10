# Umbrella
require "http"
require "json"

GMAPS_KEY = ENV.fetch('GMAPS_KEY')
PIRATE_WEATHER_KEY = ENV.fetch('PIRATE_WEATHER_KEY')

puts GMAPS_KEY
puts PIRATE_WEATHER_KEY


puts "Please enter your location:"
location = gets.chomp

# Now you can use the variable 'location' to access the user's input
puts "You entered: #{location}"

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{GMAPS_KEY}"

raw_gmaps_data = HTTP.get(gmaps_url)

puts raw_gmaps_data
