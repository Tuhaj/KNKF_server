# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin.create(full_name: "Piotr Zientara", approves_aplications: true, schedules_lectures: true, arranges_meetings: true, upgrades_users_to_organization_members: true)
Meeting.create(name:"bedzie2", date:"2014-01-13")
Meeting.create(name:"bedzie2", date:"2013-12-13")
Meeting.create(name:"bylo", date:"2012-01-13")