# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category.destroy_all
# Fanpage.destroy_all

# %w[News US Technology Business Movies Sports].each do |name|
# 	category = Category.create(name: name)
# end

require 'csv'
CSV.parse(File.open("#{Rails.root}/db/tables.csv", "r:ISO-8859-1"), :headers => true) do |row|
  Fanpage.create!(name: row[1], facebook_number: row[2], category_id: row[3].to_i) if row[3].to_i == 1
end

# {
# 	'228735667216'   => 'BBC World News',
# 	'5281959998'     => 'New York Times'
# }.each do |key, value|
# 	Fanpage.create(facebook_number: key, name: value, category: Category.all.sample)
# end

# @fb_page_id = '228735667216'
# @token = 'EAACEdEose0cBALz544cNLkv1olb4dDAkqhQruqidCnEg4lXheJ7XktpWPLV765FzBVbiQL09wvOqvcuZBLcXM8KsjD5hTh9mgAo4LEfPB3nJvL0Jk43LoGnYitzlMx6xtT5KJiW0MdLEWG1kXgtipdC9lHFA6rdewGbV0nAZDZD'
# s= PostAnalyzeService.new(@fb_page_id, @token)
# s.perform_first_time
#https://graph.facebook.com/oauth/access_token?%20client_id=499835456820667&%20client_secret=APP_SECRET&%20grant_type=fb_exchange_token&%20fb_exchange_token=EXISTING_ACCESS_TOKEN