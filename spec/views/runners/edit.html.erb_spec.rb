require 'rails_helper'

RSpec.describe "runners/edit", :type => :view do
  before(:each) do
    @runner = assign(:runner, Runner.create!(
      :stage_id => 1,
      :team_id => 1,
      :runner_status_code_id => 1,
      :name => "MyString",
      :completed => false
    ))
  end

  it "renders the edit runner form" do
    render

    assert_select "form[action=?][method=?]", runner_path(@runner), "post" do

      assert_select "input#runner_stage_id[name=?]", "runner[stage_id]"

      assert_select "input#runner_team_id[name=?]", "runner[team_id]"

      assert_select "input#runner_runner_status_code_id[name=?]", "runner[runner_status_code_id]"

      assert_select "input#runner_name[name=?]", "runner[name]"

      assert_select "input#runner_completed[name=?]", "runner[completed]"
    end
  end
end
