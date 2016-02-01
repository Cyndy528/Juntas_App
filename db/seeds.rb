# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Interest.create([{name: 'javascript'}, {name: 'css'}, {name: 'html'}, {name: 'node.js'}, {name: 'ruby'}, {name: 'angular'}, {name: 'swift'}])

	user1 = User.create([{ full_name: "Cynthia Salinas", email: "cynthia@email.com", password: "password", bio: "I love to code!"}])