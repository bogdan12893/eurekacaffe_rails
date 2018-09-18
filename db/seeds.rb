# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Ion Doe",
            email: "ion.doe@email.com",
            password:              "qweqwe",
            password_confirmation: "qweqwe",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

80.times do |n|
name  = Faker::Name.name
email = "user-#{n+1}@test.org"
password = "password"
User.create!(name:  name,
            email: email,
            password:              password,
            password_confirmation: password,
            activated: true,
            activated_at: Time.zone.now)
end
