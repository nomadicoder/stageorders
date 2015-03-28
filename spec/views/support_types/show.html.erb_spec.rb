require 'rails_helper'

RSpec.describe "support_types/show", :type => :view do
  before(:each) do
    @support_type = assign(:support_type, SupportType.create!(
      :short_code => "Short Code",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Code/)
    expect(rendered).to match(/MyText/)
  end
end
