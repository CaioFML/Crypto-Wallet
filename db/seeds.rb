# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png'
)

Coin.create!(
  description: 'Etherium',
  acronym: 'ETC',
  url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png'
)

Coin.create!(
  description: 'Dash',
  acronym: 'DASH',
  url_image: 'https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png'
)
