Facility.destroy_all
Senior.destroy_all
Fit.destroy_all

Student.destroy_all

Mission.destroy_all
FavoriteFacility.destroy_all
Availability.destroy_all
User.destroy_all



photo = []
photo.push("https://g5-assets-cld-res.cloudinary.com/image/upload/q_auto,f_auto,fl_lossy/g5/g5-c-ivr2j426-pacifica-senior-living-client/g5-cl-1ggfaylaw7-pacifica-senior-living/uploads/pacifica-senior-living-lobby.jpg")
photo.push("https://holyokeredevelopment.com/wp-content/uploads/senior-center-538x218.png")
photo.push("http://www.carevium.com/wp-content/uploads/2014/02/brookdale-emeritus-senior-living.jpg")
photo.push("http://cascadebusnews.com/wp-content/uploads/2016/11/Mt-Bachelor.jpg")
photo.push("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVPG07ZliJbPukU6nxz6P4iuTum_7kmhyRdqxszN95dj-3ukz")
counter = 0
5.times do
  user = User.create!(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
  facility = Facility.create!(address: Faker::Address.full_address, description: Faker::SiliconValley.motto, user: user, name: Faker::Company.name, photo: photo[counter])
  counter += 1
  5.times do
    senior = Senior.create!(name: Faker::Artist.name , age: 81 , description: "Cool grandpa", facility: facility)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Miryam would love to go to the cinema", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 6, 14, 30) , end_time: Time.new(2018, 12, 8, 18, 30), description: "Lets grap some beers with Gertrude", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 10, 18, 10, 30) , end_time: Time.new(2018, 10, 18, 13, 30), description: "Alex needs help with groceries. Student has to be patient and beautiful", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 1, 5, 10, 30) , end_time: Time.new(2019, 1, 5, 13, 30), description: "Jacqueline needs help setting up netflix !! Thanks", senior: senior)
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






