User.create!(name:  "Example User",
             email: "example22@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:      true,
             activated:  true,
             activated_at: Time.zone.now)


users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(3)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.listings.create!(title: title content: content)}
end