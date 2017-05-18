# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "rest-client"

Ingredient.destroy_all

puts 'creating your db....'
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = JSON.parse(response)
# => repos is an `Array` of `Hashes`.
response['drinks'].each do |ingredient|
  print "."
  Ingredient.create!(
    name: ingredient["strIngredient1"]
  )
end
puts 'finished'
