class Fanpage < ApplicationRecord
	has_many :posts
	belongs_to :category

  def update_posts(token)
    @graph = Koala::Facebook::API.new(token)
  end
end
