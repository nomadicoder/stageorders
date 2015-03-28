require 'rails_helper'

RSpec.describe "teams/index", :type => :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :number => 1,
        :name => "Name",
        :short_name => "Short Name"
      ),
      Team.create!(
        :number => 1,
        :name => "Name",
        :short_name => "Short Name"
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
  end
end
