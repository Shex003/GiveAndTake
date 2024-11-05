# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# THIS IS A TEST

# also part of test
require "open-uri"

puts 'Cleaning database, users, trades and items...'
Trade.destroy_all
Item.destroy_all
User.destroy_all

puts 'Creating users'
saul = User.create(email: 'saul@gmail.com', password: 'password', first_name: 'Saul', last_name: 'Goldman-Webb', profile_picture: 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg')
ayax = User.create(email: 'ayax@gmail.com', password: 'password', first_name: 'Ayax', last_name: 'Abreu Garcia', profile_picture: 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg')
shex = User.create(email: 'shex@gmail.com', password: 'password', first_name: 'Ezzeldin', last_name: 'Osman', profile_picture: 'https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg')

puts 'creating Items for Users'

# saul items
file = URI.open("https://lemanoosh.com/app/uploads/928_05.jpg")
item = saul.items.new(name: "Porsche 911", price: 55000, description: "A beatiful beige Porsche 911 Targa, year 1979. Exclusive for car lovers near London", category: "cars")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

file = URI.open("https://lemanoosh.com/app/uploads/444456056_122199349226011916_7210546495871314728_n1.jpg")
item = saul.items.create(name: "Sonos headphones", price: 250, description: "Imagine a Sonos speaker ported to the form factor of an over-ear headphone, and you'd be pretty close to the Ace. Their minimalist look is very on-brand for Sonos. Great sound quality!", category: "electronics")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

file = URI.open("https://lemanoosh.com/app/uploads/KONKA-TWS-EARPHONE-011.jpg")
item = saul.items.create(name: "Konika earphones", price: 190, description: "Excellent Konika earphones v156-WH-NC, experimental model 2023", category: "electronics")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save


# # ayax items
file = URI.open("https://lemanoosh.com/app/uploads/alegre-design-chair-actiu-noom60-261.jpg")
item = ayax.items.create(name: "Vitra chair", price: 450, description: "Beautiful ergonomic chairs. Vitra model S 2015. Colors: olive green and matt grey", category: "furniture")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

file = URI.open("https://lemanoosh.com/app/uploads/disassembly_lab_ecal_luginbuehl_robin_07.jpg__0x1280_q85_subsampling-21.jpg")
item = ayax.items.create(name: "Experimental shoe", price: 45, description: "Experimental shoes I created", category: "shoes")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

file = URI.open("https://lemanoosh.com/app/uploads/Permafrost_Clikk_Baby_Chair_02.jpg")
item = ayax.items.create(name: "Stokke baby chair ", price: 150, description: "Set of three Stokke baby chairs, matt green, red and light grey. Scandinavian model 3S. Light use.", category: "furniture")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save


# # shex items
file = URI.open("https://lemanoosh.com/app/uploads/Sushant-Vohra-guita-pedal-04.jpg")
item = shex.items.create(name: "Base synth", price: 55, description: "Barabass bass synth. Tone and gain amplifier", category: "electronics")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

file = URI.open("https://lemanoosh.com/app/uploads/image.jpg")
item = shex.items.create(name: "Korg KR mini", price: 350, description: "Korg KR mini rhythm synth. Had for 3 years and it's a must item on my set. Able to trade if required.", category: "electronics")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

file = URI.open("https://lemanoosh.com/app/uploads/tumblr_nskq2sviN91rwft4xo2_1280.jpg")
item = shex.items.create(name: "Alarm clock", price: 150, description: "Beautiful minimalistic alarm clock design be SEOS, Had it for three years without any issues.", category: "electronics")
item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item.save

puts 'Finished'
