require 'rails_helper'

RSpec.describe "runner_status_codes/index", :type => :view do
  before(:each) do
    assign(:runner_status_codes, [
      RunnerStatusCode.create!(
        :sequence => 1.5,
        :short_code => "Short Code",
        :description => "MyText"
      ),
      RunnerStatusCode.create!(
        :sequence => 1.5,
        :short_code => "Short Code",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of runner_status_codes" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Short Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
