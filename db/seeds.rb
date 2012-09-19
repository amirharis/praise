# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.find_by_ic_number("admin")
if u.nil?
	user = User.new
	user.ic_number = "admin"
	user.admin = true
	user.name = "Administrator"
	#user.admin_ready_only = true
	user.email = "admin@email.address"
	user.password = "admin2012"
	user.password_confirmation = "admin2012"
	user.save(:validate => false)
	puts "Admin created"
else

	puts "Admin already exist"
end