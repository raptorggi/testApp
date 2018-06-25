# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", email: "admin", password: "12345678", admin: true)

4.times do |i|
  Page.create(title: "Page #{i}", text: "text for Page #{i}")
end

4.times do |i|
  Category.create(name: "test#{i}", description: "text for Cat #{i}")
end
Category.create([{name: "test1-2", description: "1234"}, {name: "test1-1", description: "1234"}]) do |c| 
  c.parent_id = Category.find_by(name: 'test1').id
end

category = Category.find_by name: 'test1'
3.times do |i|
  category.products.create(name: "prod #{i}", description: "text prod", price: i)
end
category = Category.find_by name: 'test0'
3.times do |i|
  category.products.create(name: "prod #{i + 10}", description: "text prod", price: i + 10)
end
