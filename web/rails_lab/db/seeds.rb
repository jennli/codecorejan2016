# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
  User.create first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email
end

100.times do
  Product.create name: Faker::Commerce.product_name,
  price: Faker::Commerce.price
end

# Product.where("sale_price is NULL").each {|x| x.sale_price = Faker::Commerce.price}
