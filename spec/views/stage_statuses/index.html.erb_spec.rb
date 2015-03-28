require 'rails_helper'

RSpec.describe "stage_statuses/index", :type => :view do
  before(:each) do
    assign(:stage_statuses, [
      StageStatus.create!(
        :team_id => 1,
        :stage_id => 2,
        :runner_id => 3,
        :support_unit_id => 4,
        :runner_status_code_id => 5,
        :support_status_code_id => 6,
        :stage_status_code_id => 7
      ),
      StageStatus.create!(
        :team_id => 1,
        :stage_id => 2,
        :runner_id => 3,
        :support_unit_id => 4,
        :runner_status_code_id => 5,
        :support_status_code_id => 6,
        :stage_status_code_id => 7
      )
    ])
  end

  it "renders a list of stage_statuses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
