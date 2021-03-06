require 'rails_helper'

RSpec.describe "stage_statuses/edit", :type => :view do
  before(:each) do
    @stage_status = assign(:stage_status, StageStatus.create!(
      :team_id => 1,
      :stage_id => 1,
      :runner_id => 1,
      :support_unit_id => 1,
      :runner_status_code_id => 1,
      :support_status_code_id => 1,
      :stage_status_code_id => 1
    ))
  end

  it "renders the edit stage_status form" do
    render

    assert_select "form[action=?][method=?]", stage_status_path(@stage_status), "post" do

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
