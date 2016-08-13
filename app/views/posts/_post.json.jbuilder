json.extract! post, :id, :facebook_id, :content, :share_count, :like_count, :comment_count, :created_at, :updated_at
json.url post_url(post, format: :json)