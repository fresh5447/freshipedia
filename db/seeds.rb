require 'faker'

u = User.new(
  name: 'Admin User',
  email: 'admin@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')

u = User.new(
  name: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

wikis = []
15.times do
  wikis << Wiki.create(
    name: Faker::Lorem.words(rand(1..10)).join(" "), 
    body: Faker::Lorem.paragraph(rand(1..4)),
    user: u
  )

end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"