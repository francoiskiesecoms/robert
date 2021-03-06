puts "Starting..."
puts "Destroying!"
Availability.delete_all
FavoriteFacility.delete_all
Mission.delete_all
Senior.delete_all
Facility.delete_all
Message.delete_all
ChatRoom.delete_all
Fit.delete_all

Student.delete_all

User.delete_all

puts "Done with destroy"
photo = []
addresses = []
names = []


addresses.push("Boulevard Sylvain Dupuis 94 Anderlecht Bruxelles")
names.push ("Home Forestier")
addresses.push("Avenue des traquets 35 Auderghem")
names.push ("Résidence Berlemont")
addresses.push("Avenue commandant lothaire 61 Etterbeek")
names.push ("Résidence Lothaire")
addresses.push("Avenue Frioul 20 Evere Bruxelles Belgique")
names.push ("Seniorie d'Evere")
addresses.push("Rue Rosendael 175 Forest Bruxelles Belgique")
names.push ("Le Val des Roses")
addresses.push("Avenue A. Huysmans 73 Ixelles Bruxelles Belgique")
names.push ("Résidence Huysmans")
addresses.push(" Rue F. Volral 37 Jette Bruxelles Belgique")
names.push ("Home Chartier")
addresses.push("Avenue de Jette 2 Jette Bruxelles Belgique")
names.push ("Home Simonis")
addresses.push("Rue A. Diderich 32 Saint-gilles")
names.push ("Home les Tilleuls")


photo.push("https://imganuncios.mitula.net/maison_ginals_82330_une_grande_maison_de_campagne_de_7760099482615196159.jpg")
photo.push("http://ave-maria.maisonsdefamille.com/uploads/media/standard/5464d9811c21c.jpg")
photo.push("https://www.logement-seniors.com/uploads/medias/annonces/maisons-retraite/galeries/sources/759-maison-de-retraite-antinea-la-redorte-aude-terrasse.jpg")
photo.push("https://www.seniorieweb.be/sites/default/files/styles/colorbox-center-images/public/nursing-home-images/main/rusthuis-mrs-charmes-en-famenne.jpg?itok=08NceZHV")
photo.push("https://image.jimcdn.com/app/cms/image/transf/dimension=522x10000:format=jpg/path/s1f444dd0383ecf7f/image/i3b90bd562beeccfd/version/1392131775/image.jpg")
photo.push("http://www.perwez.be/commune/autres-services/residences-pour-seniors/av-jadot-005.jpg/@@images/f17d2792-91c8-4ddc-81e2-a672a27b0438.jpeg")
photo.push("https://www.seniorieweb.be/sites/default/files/styles/colorbox-center-images/public/nursing-home-images/main/rusthuis-lobelia.jpg?itok=-88g8EgL")
photo.push("http://www.mdr-leclosdescedres.fr/sites/default/files/IMG_0001.JPG")
photo.push("http://www.mdr-leclosdescedres.fr/sites/default/files/IMG_0001.JPG")
counter = 0
9.times do
  user = User.create!(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
  facility = Facility.create!(address:addresses[counter] , description: " maison de repos neuve qui offre des prestations hôtelières et des animations. L’accueil sur mesure et les espaces de loisirs (salon, home cinéma, piano-bar, terrasses, jardin, salle de bridge, ...) font de ce lieu un must recherché.", user: user, name: names[counter], photo: photo[counter], email:Faker::Internet.email )
  counter += 1
  1.times do
    senior = Senior.create!(name: Faker::Artist.name , age: 81 , description: "Cool grandpa", facility: facility)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Luc would love to go to the cinema", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 20, 14, 30) , end_time: Time.new(2018, 12, 20, 18, 30), description: "Marc needs help with her computer", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 10, 5, 14, 30) , end_time: Time.new(2018, 10, 5, 18, 30), description: "Lets grap some beers with Gertrude", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 11, 18, 10, 30) , end_time: Time.new(2018, 11, 18, 13, 30), description: "Alex needs help with groceries. Student has to be patient and beautiful", senior: senior)
    mission = Mission.create!(start_time: Time.new(2018, 12, 5, 10, 30) , end_time: Time.new(2018, 12, 5, 13, 30), description: "Miryam would to walk in a park!", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 1, 5, 10, 30) , end_time: Time.new(2019, 1, 5, 13, 30), description: "Jacqueline needs help setting up netflix !! Thanks", senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 2, 5, 10, 30) , end_time: Time.new(2019, 2, 5, 13, 30), description: "Gilles needs a person to take him to see the doctor" , senior: senior)
    mission = Mission.create!(start_time: Time.new(2019, 3, 5, 10, 30) , end_time: Time.new(2019, 3, 5, 13, 30), description: "Albert is looking for someone to play chess with him", senior: senior)

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


availability3 = Availability.create!(start_date: Time.new(2019, 1, 2, 10, 00) , end_date: Time.new(2019, 1, 28, 17, 00), student: student )
availability4 = Availability.create!(start_date: Time.new(2018, 10, 5, 14, 30) , end_date: Time.new(2018, 10, 5, 18, 30), student: student )
availability5 = Availability.create!(start_date: Time.new(2018, 11, 18, 10, 00) , end_date: Time.new(2018, 11, 18, 19, 00), student: student )


Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2018, 10, 5, 14, 30))[3])
Fit.create!(student:student, mission: Mission.where(start_time:Time.new(2018, 11, 18, 10, 30))[4])


mission4= Mission.where(start_time:Time.new(2018, 10, 5, 14, 30))[3]
mission5= Mission.where(start_time:Time.new(2018, 11, 18, 10, 30))[4]




mission4.review_ponctuality = 4
mission4.review_communication = 5
mission4.review_satisfaction = 5
mission4.review_comment = "It was a pleasure beeing with her, she is dedicated and take care of me in a professional way "

mission5.review_ponctuality = 4
mission5.review_communication = 3
mission5.review_satisfaction = 2
mission5.review_comment = "She arrived on time but did not communicate enough!"



mission4.save
mission5.save







