class PostAnalyzeService
  def initialize(fb_page_id, token)
    @token = token
    @fb_page_id = fb_page_id
  end

  def perform
    @page = Fanpage.where(facebook_number: @fb_page_id).first
    @graph = Koala::Facebook::API.new(@token)
    posts = @graph.get_connections(@fb_page_id, "feed",
      { fields: %w[id shares likes.summary(1).limit(1) comments.summary(1).limit(1)], limit: 100 })
    posts.each do |p|
      begin
        post = Post.where(facebook_id: p['id']).first
        post ||= Post.create!(fanpage: @page,
          facebook_id: p['id'].to_s,
          fb_created_time: p['created_time'])
        post.update_attributes(share_count: p['shares'].try(:[], 'count').to_i,
          like_count: p['likes']['summary']['total_count'],
          comment_count: p['comments']['summary']['total_count'])
      rescue Exception => e
        break
      end
    end
  end

  def perform_first_time
    @page = Fanpage.where(facebook_number: @fb_page_id).first
    @graph = Koala::Facebook::API.new(@token)
    @posts = @graph.get_connections(@fb_page_id, "feed",
      { fields: %w[id shares likes.summary(1).limit(1) comments.summary(1).limit(1)], limit: 500 })
    while (true) do
      break unless @posts.present?
      break if @page.posts.count > 1000
      @posts.each do |p|
        begin
          post = Post.where(facebook_id: p['id']).first
          post ||= Post.create!(fanpage: @page,
            facebook_id: p['id'].to_s,
            fb_created_time: p['created_time'])
          post.update_attributes(share_count: p['shares'].try(:[], 'count').to_i,
            like_count: p['likes']['summary']['total_count'],
            comment_count: p['comments']['summary']['total_count'])
        rescue Exception => e
          break
        end
      end
      @posts = @posts.next_page
    end
  end
end