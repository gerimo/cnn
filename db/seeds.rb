# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	fanpage = Fanpage.create(name: "1",facebook_number: 2, category_id: 3)
100.times do 
	content = Faker::Lorem.sentence(5)
	share_count = Faker::Number.number(2)
	like_count = Faker::Number.number(2)
	comment_count = Faker::Number.number(2)
	facebook_id = Faker::Number.number(3)
	post = fanpage.posts.create(content: content, share_count: share_count, like_count: like_count, comment_count: comment_count, facebook_id: facebook_id)
end