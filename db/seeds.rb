# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create!(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
  facility = Facility.create!(address: Faker::Address.full_address, description: Faker::SiliconValley.motto, user: user, name: "Maison Marie Immaculéee")

  5.times do
    senior = Senior.create!(name: Faker::Artist.name , age: 81 , description: "Cool grandpa", facility: facility)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Cinema with grandpa", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 6, 14, 30) , end_time: Time.new(2018, 12, 8, 18, 30), description: "Cinema with grandpa", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 10, 18, 10, 30) , end_time: Time.new(2018, 10, 18, 13, 30), description: "Cinema with grandpa", senior: senior)
  end
end

romane = User.create!(email: "romane@gmail.com", password: 'topsecret', password_confirmation: 'topsecret')

student = Student.create!(
  name: "Romane",
  address: "Rue des Champs Elysées",
  email: "kiesecoms.francois@gmail.com",
  motivation: "I'm studying nursing and would like to get more experience on weekends",
  date_of_birth: "29/10/1994",
  studies:" MA2 Business engineering",
  school: "Solvay, UCL",
  phone_number: "0491645783",
  user: romane
)


FavoriteFacility.create!(student:student, facility: Facility.last)
FavoriteFacility.create!(student:student, facility: Facility.first)


availability1 = Availability.create!(start_date: Time.new(2018, 12, 1, 10, 00) , end_date: Time.new(2018, 12, 5, 18, 00), student: student )
availability2 = Availability.create!(start_date: Time.new(2018, 12, 9, 10, 00) , end_date: Time.new(2018, 12, 28, 17, 00), student: student )











