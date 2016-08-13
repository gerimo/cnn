# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
	name = Faker::Lorem.sentence(5)
	category = Category.create(name: name)
end
	categorys = Category.all
10.times do
	name = Faker::Lorem.sentence(20)
	facebook_number = Faker::Number.number(4)
	categorys.each{ |category| category.fanpages.create(name: name, facebook_number: facebook_number)}
end
	fanpages = Fanpage.all
20.times do 
	fanpages.each{
	 |fanpage| 
	 	content = Faker::Lorem.sentence(10)
		share_count = Faker::Number.number(3)
		like_count = Faker::Number.number(3)
		comment_count = Faker::Number.number(3)
		facebook_id = Faker::Number.number(4)
		created_at = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
	  fanpage.posts.create(content: content, share_count: share_count, like_count: like_count, comment_count: comment_count, facebook_id: facebook_id, created_at: created_at)}
end