require 'rails_helper'

RSpec.describe "support_types/index", :type => :view do
  before(:each) do
    assign(:support_types, [
      SupportType.create!(
        :short_code => "Short Code",
        :description => "MyText"
      ),
      SupportType.create!(
        :short_code => "Short Code",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of support_types" do
    render
    assert_select "tr>td", :text => "Short Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
