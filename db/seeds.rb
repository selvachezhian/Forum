# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## default roles
#Role.create!(name: 'Admin')
#Role.create!(name: 'User')
#
## default users
#User.create!(first_name: 'Admin', last_name: 'User', email: 'admin.user@forum.com', password: Digest::MD5.hexdigest('admin.user'), role_id: Role.find_by_name('Admin').id)
#User.create!(first_name: 'Normal', last_name: 'User', email: 'normal.user@forum.com', password: Digest::MD5.hexdigest('normal.user'), role_id: Role.find_by_name('User').id)
