# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Snack.create!(name: 'Nice! Snack Mix', calories: 100)
Snack.create!(name: 'Nice! Rocky Road Ice Cream', calories: 300)

Snack.create!(name: 'Microwave Pizza', calories: 400)

Snack.create!(name: 'M&Ms', calories: 300)
Snack.create!(name: 'Skittles', calories: 300)
Snack.create!(name: 'Snickers', calories: 300)


Brand.create!(name: 'Mars', logo: 'https://i.ytimg.com/vi/FW0kUmoTQFM/maxresdefault.jpg')
Brand.create!(name: 'DiGiorno', 'http://www.digiorno.com/Content/Images/header/DiGiornoLogo.png')
Brand.create!(name: 'Duane Reade', logo: 'https://upload.wikimedia.org/wikipedia/en/thumb/0/06/Duane_Reade_Logo.svg/849px-Duane_Reade_Logo.svg.png')
Brand.create!(name: 'Ari Co', logo: 'http://aribrenner.com/media/images/ari0.jpg')
