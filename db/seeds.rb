Facility.destroy_all
Senior.destroy_all
Fit.destroy_all

Student.destroy_all

Mission.destroy_all
FavoriteFacility.destroy_all
Availability.destroy_all
User.destroy_all
ChatRoom.destroy_all
Message.destroy_all


photo = []
photo.push("https://g5-assets-cld-res.cloudinary.com/image/upload/q_auto,f_auto,fl_lossy/g5/g5-c-ivr2j426-pacifica-senior-living-client/g5-cl-1ggfaylaw7-pacifica-senior-living/uploads/pacifica-senior-living-lobby.jpg")
photo.push("https://holyokeredevelopment.com/wp-content/uploads/senior-center-538x218.png")
photo.push("http://www.carevium.com/wp-content/uploads/2014/02/brookdale-emeritus-senior-living.jpg")
photo.push("http://cascadebusnews.com/wp-content/uploads/2016/11/Mt-Bachelor.jpg")
photo.push("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVPG07ZliJbPukU6nxz6P4iuTum_7kmhyRdqxszN95dj-3ukz")
counter = 0
5.times do
  user = User.create!(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
  facility = Facility.create!(address: Faker::Address.full_address, description: Faker::SiliconValley.motto, user: user, name: Faker::Company.name, photo: photo[counter], email:Faker::Internet.email )
  counter += 1
  5.times do
    senior = Senior.create!(name: Faker::Artist.name , age: 81 , description: "Cool grandpa", facility: facility)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Miryam would love to go to the cinema", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Miryam needs help with her computer", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 10, 5, 14, 30) , end_time: Time.new(2018, 10, 5, 18, 30), description: "Lets grap some beers with Gertrude", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 11, 18, 10, 30) , end_time: Time.new(2018, 11, 18, 13, 30), description: "Alex needs help with groceries. Student has to be patient and beautiful", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 5, 10, 30) , end_time: Time.new(2018, 12, 5, 13, 30), description: "Miryam would to walk in a park!", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 1, 5, 10, 30) , end_time: Time.new(2019, 1, 5, 13, 30), description: "Jacqueline needs help setting up netflix !! Thanks", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 2, 5, 10, 30) , end_time: Time.new(2019, 2, 5, 13, 30), description: "Jacqueline needs help setting up netflix !! Thanks", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 3, 5, 10, 30) , end_time: Time.new(2019, 3, 5, 13, 30), description: "Jacqueline needs help setting up netflix !! Thanks", senior: senior)

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
availability3 = Availability.create!(start_date: Time.new(2019, 1, 2, 10, 00) , end_date: Time.new(2019, 1, 28, 17, 00), student: student )
availability4 = Availability.create!(start_date: Time.new(2018, 10, 5, 14, 30) , end_date: Time.new(2018, 10, 5, 18, 30), student: student )
availability5 = Availability.create!(start_date: Time.new(2018, 11, 18, 10, 00) , end_date: Time.new(2018, 11, 18, 19, 00), student: student )
availability6 = Availability.create!(start_date: Time.new(2018, 12, 5, 10, 00) , end_date: Time.new(2018, 12, 5, 19, 00), student: student )



Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[0])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2019, 2, 5, 10, 30))[1])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[2])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2018, 10, 5, 14, 30))[3])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2018, 11, 18, 10, 30))[4])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2018, 12, 5, 10, 30))[5])


mission1= Mission.where(start_time:Time.new(2019, 1, 5, 10, 30))[0]
mission2= Mission.where(start_time:Time.new(2019, 2, 5, 10, 30))[1]
mission3= Mission.where(start_time:Time.new(2019, 3, 5, 10, 30))[2]
mission4= Mission.where(start_time:Time.new(2018, 10, 5, 14, 30))[3]
mission5= Mission.where(start_time:Time.new(2018, 11, 18, 10, 30))[4]
mission6= Mission.where(start_time:Time.new(2018, 12, 5, 10, 30))[5]



mission1.review_ponctuality = 4
mission1.review_communication = 4
mission1.review_satisfaction = 5
mission1.review_comment = "Romane was awesome. She showed up on time and brought me to the museum to check out the Kandisky’s exhibition. It was a really nice moment; she even took the time to read out loud all the explainations under the master pieces! We finished the day with a warm hot chocolate at home. Thank you Romane, I’m looking forward to the next time."

mission2.review_ponctuality = 1
mission2.review_communication = 5
mission2.review_satisfaction = 3
mission2.review_comment = "Even though Romane is really talkative and always has nice stories to tell... she showed up 2 hours late without any notice.. That’s a pity! After that, we had a great time together; she taught me how to write an email to my grand-daughter living abroad, how useful!"

mission3.review_ponctuality = 5
mission3.review_communication = 3
mission3.review_satisfaction = 4
mission3.review_comment = "Romane was tired so she didn’t talk much on the car-journey to my doctor’s appointment. Nevertheless, her smile and punctuality are always appreciated."

mission4.review_ponctuality = 4
mission4.review_communication = 5
mission4.review_satisfaction = 5
mission4.review_comment = "It was a pleasure beeing with her, she is dedicated and take care of me in a professional way "

mission5.review_ponctuality = 4
mission5.review_communication = 3
mission5.review_satisfaction = 2
mission5.review_comment = "She arrived on time but did not communicate enough!"

mission6.review_ponctuality = 4
mission6.review_communication = 5
mission6.review_satisfaction = 2
mission6.review_comment = "Talks a bit too much!"

mission1.save
mission2.save
mission3.save
mission4.save
mission5.save
mission6.save

chatroom1 = ChatRoom.new
chatroom1.save

message1 = Message.new(chat_room: chatroom1)
message1.user = romane
message1.save




