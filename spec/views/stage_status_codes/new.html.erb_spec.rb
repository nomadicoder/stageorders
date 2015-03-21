require 'rails_helper'

RSpec.describe "stage_status_codes/new", :type => :view do
  before(:each) do
    assign(:stage_status_code, StageStatusCode.new(
      :short_code => "MyString",
      :description => "MyString",
      :sequence => 1.5,
      :runner_status_code_id => 1,
      :support_status_code_id => 1
    ))
  end

  it "renders new stage_status_code form" do
    render

    assert_select "form[action=?][method=?]", stage_status_codes_path, "post" do

      assert_select "input#stage_status_code_short_code[name=?]", "stage_status_code[short_code]"

      assert_select "input#stage_status_code_description[name=?]", "stage_status_code[description]"

      assert_select "input#stage_status_code_sequence[name=?]", "stage_status_code[sequence]"

      assert_select "input#stage_status_code_runner_status_code_id[name=?]", "stage_status_code[runner_status_code_id]"

      assert_select "input#stage_status_code_support_status_code_id[name=?]", "stage_status_code[support_status_code_id]"
    end
  end
end
