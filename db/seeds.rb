
# email: "example@example.com",
# password: "password"
# nickname: "testuser",
# firstname: "Crystall",
# lastname: "Noda",
# details: "This is my details.The student profile shows the s...",
# photo: nil,
# supporting_id: 1,
# gender_id: 2,
female = Gender.find(1)
male = Gender.find(2)
gender_num = Gender.all.count
team_num = Supporting.all.count

300.times do |n|
  email = "example#{n+1}@example.com"
  nickname  = Faker::Name.name[0..10]
  firstname = Faker::Name.first_name[0..10]
  lastname = Faker::Name.last_name[0..10]
  details = Faker::Lorem.sentence[0..10]
  supporting_id = n % team_num + 1
  gender_id = n % gender_num + 1

  account = Account.create!(email: email, nickname: nickname, firstname: firstname, lastname: lastname, details: details, photo: nil, supporting_id: supporting_id, gender_id: gender_id, password: "password")

  if gender_id == 1
    account.gender_interests << male
  else
    account.gender_interests << female
  end

end
