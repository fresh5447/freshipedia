require 'faker'

u = User.new(
  name: 'Sample User',
  email: 'sample@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

wikis = []
15.times do
  wikis << Wiki.create(
    name: Faker::Lorem.words(rand(1..10)).join(" "), 
    body: Faker::Lorem.paragraph(rand(1..4))
  )

end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"