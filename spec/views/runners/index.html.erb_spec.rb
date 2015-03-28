require 'rails_helper'

RSpec.describe "runners/index", :type => :view do
  before(:each) do
    assign(:runners, [
      Runner.create!(
        :stage_id => 1,
        :team_id => 2,
        :runner_status_code_id => 3,
        :name => "Name",
        :completed => false
      ),
      Runner.create!(
        :stage_id => 1,
        :team_id => 2,
        :runner_status_code_id => 3,
        :name => "Name",
        :completed => false
      )
    ])
  end

  it "renders a list of runners" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
