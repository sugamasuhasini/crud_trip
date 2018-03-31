require 'httparty'

url = "http://localhost:3000/trips/"
urlgeo = "https://maps.googleapis.com/maps/api/geocode/json?"
urldist = "https://maps.googleapis.com/maps/api/distancematrix/json?"

access_key_geo = "AIzaSyBikWlXuiw_K26pZEcasp8nTSPmxAzNtnk"
access_key_dist = "AIzaSyDGTx7d3l3EHUkpqMSHybETjDk4bFkhghs"

puts "enter the id of the trip to be updated"

id = gets.chomp

puts "enter the source"

source = gets.chomp

puts "enter the destination"

destination = gets.chomp

puts "taking latitude and longitude from google geo"

responsegeo = HTTParty.get("#{urlgeo}address=#{destination}&key=#{access_key_geo}")

destination_lat = "#{responsegeo["results"][0]["geometry"]["location"]["lat"]}"

#puts destination_lat

destination_lng = "#{responsegeo["results"][0]["geometry"]["location"]["lng"]}"

#puts destination_lng
 puts "taking distance from google metric"

responsedist = HTTParty.get("#{urldist}origins=#{source}&destinations=#{destination}&key=#{access_key_dist}")

distance = "#{responsedist["rows"][0]["elements"][0]["distance"]["text"]}"


fin_url = "#{url}#{id}.json"


data = {

	"source" => source,
	"destination" => destination,
	"destination_lat" => destination_lat,
	"destination_lng" => destination_lng,
	"distance" => distance
}



response = HTTParty.patch(fin_url,{body: {
		trip: data
		}})
puts response
