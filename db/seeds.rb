# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

obama = User.find_or_create_by(name: 'Obama', phone_number: '111-111-1111', email: 'potus@obamaserver.net', 
						password: 'password', password_confirmation: 'password')
martha = User.find_or_create_by(name: 'Martha Stewart', phone_number: '123-234-3456', email: 'martha@email.com',
						password: 'password', password_confirmation: 'password')
jake = User.find_or_create_by(name: 'Jake Sorce', phone_number: '345-456-5678', email: 'jake@email.com',
						password: 'password', password_confirmation: 'password')

obama.homes.find_or_create_by(title: 'D.C. Mansion', description: 'Large white mansion, good security', sq_ft: 10000,
									 floors: 5, price: 500000)
martha.homes.find_or_create_by(title: 'Cottage in the Hamptons', description: 'Gorgeous summer getaway',
										sq_ft: 2500, floors: 1, price: 1000000)
martha.homes.find_or_create_by(title: 'Bungalow', description: 'Well decorated', sq_ft: 1000, floors: 1, price: 200000)
martha.homes.find_or_create_by(title: '')
jake.homes.find_or_create_by(title: 'Sweet Bachelor Pad', description: 'Moving up and out', sq_ft: 800, floors: 1,
									price: 150000)

Address.find_or_create_by(street: 'Some Lane', city: 'Salt Lake City', state: 'utah', zip: '84111', home_id:(Home.find_by(title: 'Sweet Bachelor Pad').id))
