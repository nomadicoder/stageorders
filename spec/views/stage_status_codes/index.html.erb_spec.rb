require 'rails_helper'

RSpec.describe "stage_status_codes/index", :type => :view do
  before(:each) do
    assign(:stage_status_codes, [
      StageStatusCode.create!(
        :short_code => "Short Code",
        :description => "Description",
        :sequence => 1.5,
        :runner_status_code_id => 1,
        :support_status_code_id => 2
      ),
      StageStatusCode.create!(
        :short_code => "Short Code",
        :description => "Description",
        :sequence => 1.5,
        :runner_status_code_id => 1,
        :support_status_code_id => 2
      )
    ])
  end

  it "renders a list of stage_status_codes" do
    render
    assert_select "tr>td", :text => "Short Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
