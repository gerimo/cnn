# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Fanpage.destroy_all

%w[sports magazine music game].each do |name|
	category = Category.create(name: name)
end
{
	'15704546335'    => 'Fox News',
	'18468761129'    => 'Huffington Post',
  '7331091005'     => 'Bleacher Report',
  '5550296508'     => 'CNN Breaking News',
	'228735667216'   => 'BBC World News',
	'5281959998'     => 'New York Times',
	'86680728811'    => 'ABC News',
	'155869377766434'=> 'NBC News'
}.each do |key, value|
	Fanpage.create(facebook_number: key, name: value, category: Category.all.sample)
end

@fb_page_id = '15704546335'
@token = 'EAACEdEose0cBAKpx8ZBbF4gZAQB3iDxkZCl3VRlEfGtCmxPwDcprVttK8aAr61VQ6fZAr5aeRnmqavKMVONLwQm34wXOHKZATQi7rgWP9pzeVs1YE08XeeSFDrLlXFCxZAz7EZAOokZBJgZCGW2X9bMRAB2Q6CyMXlsuSc8KCXVPglQZDZD'
s= PostAnalyzeService.new(@fb_page_id, @token)
s.perform_first_time