# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create!(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
  facility = Facility.create!(address: Faker::Address.full_address, description: Faker::SiliconValley.motto, user: user, name: "Maison Marie Immaculée")

  5.times do
    senior = Senior.create!(name: Faker::Artist.name , age: 81 , description: "Cool grandpa", facility: facility)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Cinema with grandpa", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 6, 14, 30) , end_time: Time.new(2018, 12, 8, 18, 30), description: "Cinema with grandpa", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 10, 18, 10, 30) , end_time: Time.new(2018, 10, 18, 13, 30), description: "Cinema with grandpa", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 1, 5, 10, 30) , end_time: Time.new(2019, 1, 5, 13, 30), description: "Cinema with grandpa", senior: senior)
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
availability2 = Availability.create!(start_date: Time.new(2019, 1, 2, 10, 00) , end_date: Time.new(2019, 1, 28, 17, 00), student: student )

Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[0])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[1])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[2])

mission1= Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[0]
mission2= Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[1]
mission3= Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[2]

mission1.review_ponctuality = 4
mission1.review_communication = 2
mission1.review_satisfaction = 5
mission1.review_comment = "Romane was awesome. We brought me to a place called Bclub, and I danced with so many of her friends!!! So cool!! "

mission2.review_ponctuality = 4
mission2.review_communication = 2
mission2.review_satisfaction = 5
mission2.review_comment = "Romane showed up 2 hours late cause she broke her car.. Do not really believe her but still, she was a nice to play soccer with "

mission3.review_ponctuality = 4
mission3.review_communication = 5
mission3.review_satisfaction = 5
mission3.review_comment = "Top !!! Top !!! So cool!!!!!!! Damnnnnn Grandkids c'est d'la bal "

mission1.save
mission2.save
mission3.save






