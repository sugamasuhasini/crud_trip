require 'httparty'

url = "http://localhost:3000/trips/"

puts "enter the id of the trip to be displayed"

id = gets.chomp

trip = HTTParty.get("#{url}#{id}.json")

puts "\t\n id: #{trip["id"]} source: #{trip["source"]} destination: #{trip["destination"]} lattitude: #{trip["destination_lat"]} longitude: #{trip["destination_lng"]} distance: #{trip["distance"]}"