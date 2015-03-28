require 'rails_helper'

RSpec.describe "runner_status_codes/edit", :type => :view do
  before(:each) do
    @runner_status_code = assign(:runner_status_code, RunnerStatusCode.create!(
      :sequence => 1.5,
      :short_code => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit runner_status_code form" do
    render

    assert_select "form[action=?][method=?]", runner_status_code_path(@runner_status_code), "post" do

      assert_select "input#runner_status_code_sequence[name=?]", "runner_status_code[sequence]"

      assert_select "input#runner_status_code_short_code[name=?]", "runner_status_code[short_code]"

      assert_select "textarea#runner_status_code_description[name=?]", "runner_status_code[description]"
    end
  end
end
