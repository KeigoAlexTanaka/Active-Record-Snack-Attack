# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mars = Brand.create!(name: 'Mars', logo: 'https://i.ytimg.com/vi/FW0kUmoTQFM/maxresdefault.jpg')
digiorno = Brand.create!(name: 'DiGiorno', logo: 'http://www.digiorno.com/Content/Images/header/DiGiornoLogo.png')
duane_read = Brand.create!(name: 'Duane Reade', logo: 'https://upload.wikimedia.org/wikipedia/en/thumb/0/06/Duane_Reade_Logo.svg/849px-Duane_Reade_Logo.svg.png')
ari_co = Brand.create!(name: 'Ari Co', logo: 'http://aribrenner.com/media/images/ari0.jpg')

pretzel_mix = Snack.create!(name: 'Nice! Pretzel Mix', calories: 100, brand_id: duane_read.id)
ice_cream = Snack.create!(name: 'Nice! Rocky Road Ice Cream', calories: 300, brand_id: duane_read.id)

pizza = Snack.create!(name: 'Microwave Pizza', calories: 400, brand_id: digiorno.id)

mms = Snack.create!(name: 'M&Ms', calories: 300, brand_id: mars.id)
skittles = Snack.create!(name: 'Skittles', calories: 300, brand_id: mars.id)
snickers = Snack.create!(name: 'Snickers', calories: 300, brand_id: mars.id)


stacey = Consumer.create!(name: 'Stacey', age: 20)
lacey = Consumer.create!(name: 'Lacey', age: 30)
tracey = Consumer.create!(name: 'Tracey', age: 40)
macey = Consumer.create!(name: 'Macey', age: 50)

# stacey's favorites
Consumership.create!(consumer_id: stacey.id, snack_id: mms.id)
Consumership.create!(consumer_id: stacey.id, snack_id: ice_cream.id)
Consumership.create!(consumer_id: stacey.id, snack_id: skittles.id)

# lacey's favorites
Consumership.create!(consumer: lacey, snack: snickers)
Consumership.create!(consumer: lacey, snack: mms)

# tracey's favorites
Consumership.create!(consumer: tracey, snack: pretzel_mix)
Consumership.create!(consumer: tracey, snack: mms)

# macey has no favorites. she does not like snacks
