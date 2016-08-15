class Fanpage < ApplicationRecord
	has_many :posts
	belongs_to :category

  def update_posts(token)
    @graph = Koala::Facebook::API.new(token)
  end

  def self.hourly_update
    Fanpage.each do |fanpage|
      if @token = FbToken.desc(:created_at).first
        if Post.count < 500
          PostAnalyzeService.new(fanpage.facebook_number, @token).perform_first_time
        else
          PostAnalyzeService.new(fanpage.facebook_number, @token).perform
        end
      end
    end
  end
end
