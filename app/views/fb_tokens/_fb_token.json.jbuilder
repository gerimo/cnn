json.extract! fb_token, :id, :token, :created_at, :updated_at
json.url fb_token_url(fb_token, format: :json)