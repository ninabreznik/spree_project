# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = Product.create ([
       { name: "t-shirt", description: "This is a t-shirt description", image_url: "www.example.com/1", price: 2}, 
       { name: "trousers", description: "This is a trousers description", image_url: "www.example.com/2", price: 3},
       { name: "coat", description: "This is a coat description", image_url: "www.example.com/3", price: 4},
       { name: "skirt", description: "This is a skirt description", image_url: "www.example.com/4", price: 5},
       { name: "shoes", description: "This is a shoes description", image_url: "www.example.com/5", price: 6},         
       { name: "sweather", description: "This is a sweather description", image_url: "www.example.com/6", price: 7},
       { name: "hat", description: "This is a hat description", image_url: "www.example.com/7", price: 99},          
       { name: "gloves", description: "This is a gloves description", image_url: "www.example.com/8", price: 123},
       { name: "scarf", description: "This is a scarf description", image_url: "www.example.com/9", price: 33} ,             
       { name: "bag", description: "This is a bag description", image_url: "www.example.com/10", price: 90},
           ])
