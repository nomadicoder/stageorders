require 'rails_helper'

RSpec.describe "blogs/index", :type => :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
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
      ),
      Blog.create!(
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
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Host Url".to_s, :count => 2
    assert_select "tr>td", :text => "Access Path".to_s, :count => 2
    assert_select "tr>td", :text => "Blog Url".to_s, :count => 2
    assert_select "tr>td", :text => "Results Url".to_s, :count => 2
    assert_select "tr>td", :text => "Access Url".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Blog Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
