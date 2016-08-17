class Fanpage < ApplicationRecord
	has_many :posts
	belongs_to :category

  def update_posts(token)
    @graph = Koala::Facebook::API.new(token)
  end

  def self.hourly_update
    Fanpage.order('created_at desc').each do |fanpage|
      @token = FbToken.order(created_at: :desc).first.try(:token)
      if fanpage.facebook_number.present? && @token.present?
        if fanpage.posts.count < 500
          PostAnalyzeService.new(fanpage.facebook_number, @token).perform_first_time
        else
          PostAnalyzeService.new(fanpage.facebook_number, @token).perform
        end
      end
    end
  end
end
