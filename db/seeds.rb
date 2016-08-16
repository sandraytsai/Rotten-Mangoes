# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  firstname: 'Admin',
  lastname: 'Person',
  email: 'admino@example.com',
  password: 'testing',
  admin: true
)

User.create!(
  firstname: 'Allen',
  lastname: 'Tsai',
  email: 'allentsai@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Mingo',
  lastname: 'Tsai',
  email: 'mingotsai@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Amber',
  lastname: 'Chen',
  email: 'amberchen@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Four',
  email: 'p4@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Five',
  email: 'p5@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Six',
  email: 'p6@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Seven',
  email: 'p7@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Eight',
  email: 'p8@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Nine',
  email: 'p9@example.com',
  password: 'testing',
  admin: false
)

User.create!(
  firstname: 'Person',
  lastname: 'Ten',
  email: 'p10@example.com',
  password: 'testing',
  admin: false
)
