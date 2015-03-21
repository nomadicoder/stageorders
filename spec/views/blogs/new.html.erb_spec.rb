require 'rails_helper'

RSpec.describe "blogs/new", :type => :view do
  before(:each) do
    assign(:blog, Blog.new(
      :team_id => 1,
      :host_url => "MyString",
      :access_path => "MyString",
      :blog_url => "MyString",
      :results_url => "MyString",
      :access_url => "MyString",
      :username => "MyString",
      :password => "MyString",
      :blog_number => "MyString",
      :results_post_number => 1,
      :category => "MyString"
    ))
  end

  it "renders new blog form" do
    render

    assert_select "form[action=?][method=?]", blogs_path, "post" do

      assert_select "input#blog_team_id[name=?]", "blog[team_id]"

      assert_select "input#blog_host_url[name=?]", "blog[host_url]"

      assert_select "input#blog_access_path[name=?]", "blog[access_path]"

      assert_select "input#blog_blog_url[name=?]", "blog[blog_url]"

      assert_select "input#blog_results_url[name=?]", "blog[results_url]"

      assert_select "input#blog_access_url[name=?]", "blog[access_url]"

      assert_select "input#blog_username[name=?]", "blog[username]"

      assert_select "input#blog_password[name=?]", "blog[password]"

      assert_select "input#blog_blog_number[name=?]", "blog[blog_number]"

      assert_select "input#blog_results_post_number[name=?]", "blog[results_post_number]"

      assert_select "input#blog_category[name=?]", "blog[category]"
    end
  end
end
