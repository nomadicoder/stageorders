require 'rails_helper'

RSpec.describe "blogs/show", :type => :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :team_id => 1,
      :host_url => "Host Url",
      :access_path => "Access Path",
      :blog_url => "Blog Url",
      :results_url => "Results Url",
      :access_url => "Access Url",
      :username => "Username",
      :password => "Password",
      :blog_number => "Blog Number",
      :results_post_number => 2,
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Host Url/)
    expect(rendered).to match(/Access Path/)
    expect(rendered).to match(/Blog Url/)
    expect(rendered).to match(/Results Url/)
    expect(rendered).to match(/Access Url/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Blog Number/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Category/)
  end
end
