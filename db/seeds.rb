# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: "zrazic@wp.pl", password: "Ubuntu618")
Admin.create(email: "katarzyna.dworakowska@wp.pl", password: "Nietzsche")

Meeting.create(name:"Następne spotkanie", date:"2014-01-10")
Meeting.create(name:"Gadamer", date:"2013-12-06")
Meeting.create(name:"bylo", date:"2012-01-13")


User.create(full_name: "Piotr", degree: "MA", password: "mama1234", email: "piotr.zientara1@gmail.com")
User.create(full_name: "Hieronim", degree: "Professor", password: "mama1234", email: "zrazic@wp.pl")
User.create(full_name: "Katarzyna Dworakowska", degree: "mgr", password: "Nietzsche", email: "katarzyna.dworakowska@wp.pl", knkf_member: true, referee: true)



Reading.create(author: "Hegel", title: "Wiedza Absolutna", description: "it's a long story...", votes_for:0, is_reworked: false)
Reading.create(author: "Francis Fukuyama", title: "Koniec Człowieka", description: "wszystko co chcielibyśmy wiedzieć o tym co amerykanie myślą o współczesności", votes_for:0, is_reworked: true)
Reading.create(author: "Jacques Derrida", title: "Przemoc i metafizyka", description: "Metafora, nim staje się retoryczną procedurą w języku, byłaby wyłonieniem się samego języka. A filozofia jest jedynie tym językiem; i w najlepszym razie i w pewnym nieoddzielnym znaczeniu tego wyrażenia może jedynie mówić…", votes_for:0, is_reworked: false)
Reading.create(author: "Gadamer", title: "Historia pojęć jako filozofia", description: "20 s.", votes_for:3, is_reworked: false)
