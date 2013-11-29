# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: "zrazic@wp.pl", password: "Ubuntu618")

 Meeting.create(name:"bedzie2", date:"2014-01-13")
 Meeting.create(name:"bedzie2", date:"2013-12-13")
 Meeting.create(name:"bylo", date:"2012-01-13")

User.create(full_name: "Piotr", degree: "MA", password: "mama1234", email: "piotr.zientara1@gmail.com")
User.create(full_name: "Hieronim", degree: "Professor", password: "mama1234", email: "zrazic@wp.pl")



Reading.create(author: "Hegel", title: "Wiedza Absolutna", description: "it's a long story...", votes_for:3, is_reworked: false)
Reading.create(author: "Francis Fukuyama", title: "Koniec Człowieka", description: "wszystko co chcielibyśmy wiedzieć o tym co amerykanie myślą o współczesności", votes_for:1, is_reworked: true)
Reading.create(author: "Jacques Derrida", title: "Przemoc i metafizyka", description: "Metafora, nim staje się retoryczną procedurą w języku, byłaby wyłonieniem się samego języka. A filozofia jest jedynie tym językiem; i w najlepszym razie i w pewnym nieoddzielnym znaczeniu tego wyrażenia może jedynie mówić…", votes_for:2, is_reworked: false)