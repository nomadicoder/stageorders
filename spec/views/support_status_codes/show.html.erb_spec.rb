require 'rails_helper'

RSpec.describe "support_status_codes/show", :type => :view do
  before(:each) do
    @support_status_code = assign(:support_status_code, SupportStatusCode.create!(
      :sequence => 1.5,
      :short_code => "Short Code",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Short Code/)
    expect(rendered).to match(/MyText/)
  end
end
