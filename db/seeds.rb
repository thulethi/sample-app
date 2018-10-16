User.create!( name:   "Sample User",
              email:  "example@email.com",
              password:               "123456",
              password_confirmation:  "123456",
              admin: true)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  User.create!( name:   name,
                email:  email,
                password:               password,
                password_confirmation:  password)
end

users = User.order(:created_at).first(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
