json.array!(@blogs) do |blog|
  json.extract! blog, :id, :team_id, :host_url, :access_path, :blog_url, :results_url, :access_url, :username, :password, :blog_number, :results_post_number, :category
  json.url blog_url(blog, format: :json)
end
