require 'httparty'

url = "http://localhost:3000/trips.json"

trips = HTTParty.get("#{url}")

trips.each do |trip|
	puts "\t\n id: #{trip["id"]} source: #{trip["source"]} destination: #{trip["destination"]} lattitude: #{trip["destination_lat"]} longitude: #{trip["destination_lng"]} distance: #{trip["distance"]}"
end
