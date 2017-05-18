# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "rest-client"

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

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


Cocktail.create!(
  name: "Tequila Sunrise",
  image_url: "http://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/5/28/1/KC0604H_Tequila-Sunrise_s4x3.jpg.rend.hgtvcom.616.462.jpeg"
)

Cocktail.create!(
  name: "Mojito",
  image_url: "http://punchdrink.com/wp-content/uploads/2013/12/Mojito.jpg"
)

puts 'finished'
