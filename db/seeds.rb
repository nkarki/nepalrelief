# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! do |u|
  u.email     = 'admin@example.com'
  u.password    = 'admin123'
  u.role = 'administrator'
  u.approved = true
end if not User.exists?(:email=>'admin@example.com')

volunteers = [
  { 
    name: "Pratyut Amatya",
    email: "pratyut@gmail.com",
    phone: "9841123456",
    skillsets: "developer",
    location: "Kirtipur"
  },
  { 
    name: "Dipesh Gautam",
    email: "dipesh@gmail.com",
    phone: "9841123456",
    skillsets: "developer, film maker, photographer",
    location: "Kuleshwar"
  },
  { 
    name: "Abhaya Thapa",
    email: "thapa.abhaya@gmail.com",
    phone: "9841123456",
    skillsets: "negotiator",
    location: "Jawalakhel"
  },
]

volunteers.each do |v|
  Volunteer.create! v
end
