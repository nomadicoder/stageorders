require 'rails_helper'

RSpec.describe "stage_statuses/new", :type => :view do
  before(:each) do
    assign(:stage_status, StageStatus.new(
      :team_id => 1,
      :stage_id => 1,
      :runner_id => 1,
      :support_unit_id => 1,
      :runner_status_code_id => 1,
      :support_status_code_id => 1,
      :stage_status_code_id => 1
    ))
  end

  it "renders new stage_status form" do
    render

    assert_select "form[action=?][method=?]", stage_statuses_path, "post" do

      assert_select "input#stage_status_team_id[name=?]", "stage_status[team_id]"

      assert_select "input#stage_status_stage_id[name=?]", "stage_status[stage_id]"

      assert_select "input#stage_status_runner_id[name=?]", "stage_status[runner_id]"

      assert_select "input#stage_status_support_unit_id[name=?]", "stage_status[support_unit_id]"

      assert_select "input#stage_status_runner_status_code_id[name=?]", "stage_status[runner_status_code_id]"

      assert_select "input#stage_status_support_status_code_id[name=?]", "stage_status[support_status_code_id]"

      assert_select "input#stage_status_stage_status_code_id[name=?]", "stage_status[stage_status_code_id]"
    end
  end
end
