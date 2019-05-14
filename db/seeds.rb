# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
  users =User.create!(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name,email:Faker::Internet.email,
                     description:Faker::Superhero.descriptor,age:Faker::Number.within(1..50),
                     city_id: rand(1..10))
end

10.times do
  city = City.create!(name:Faker::Address.city,zip_code:Faker::Address.zip_code)
end

 20.times do
   gossip =Gossip.create!(title:Faker::DcComics.title,content:Faker::Restaurant.type,user_id: User.all.sample.id)
 end

10.times do
  tags = Tag.create!(title: Faker::Book.genre)
end

20.times do
  private_message = PrivateMessage.create!(content:Faker::DcComics.title, sender_id: User.all.sample.id, recipient_id: User.all.sample.id)
end

20.times do
  comments= Comment.create!(content:Faker::Superhero.descriptor,user_id: rand(User.first.id..User.last.id),gossip_id: rand(Gossip.first.id..Gossip.last.id))
end

20.times do
  likes = Like.create(user_id: User.all.sample.id, gossip_id: rand(1..20),comment_id: rand(1..20))
end
