# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Server.destroy_all
Membership.destroy_all
nicolas = User.create!({username: 'Karateman', password: 'Glubgluby', email: 'nicolas.e.schneider@vanderbilt.edu'})
marcus = User.create!({username: 'ILoveSmashUltimate', password: 'YoshiMain', email: 'mark@markymark.mark'})
wellington = User.create!({username: 'MyNetflixSux', password: 'TekashiIsMyIdol', email: 'ImABigDeal@baller.bank'})

server1 = Server.create!({ name: 'general Chat', creator_id: nicolas.id})

server2 = Server.create!({ name: 'lets bad talk nick', creator_id: wellington.id})
     

Membership.create!({user: nicolas, location: server1, location_type: "Server"})
Membership.create!({user: wellington, location: server1,location_type: "Server"})
Membership.create!({user: marcus, location: server1,location_type: "Server"})


Membership.create!({user: marcus, location: server2,location_type: "Server"})
Membership.create!({user: wellington, location: server2,location_type: "Server"})
