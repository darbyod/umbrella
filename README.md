# Umbrella
require "http"
require "json"


# Access the API key secret stored in the environment variable
gmaps_key = ENV['GMAPS_KEY']

# Now you can use the API key in your script
puts "My API Key: #{gmaps_key}"
