require 'httparty'

url = "http://localhost:3000/trips/"

puts "enter the id of the trip to be deleted"

id = gets.chomp

trip = HTTParty.delete("#{url}#{id}.json")