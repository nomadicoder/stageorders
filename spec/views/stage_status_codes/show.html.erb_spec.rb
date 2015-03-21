require 'rails_helper'

RSpec.describe "stage_status_codes/show", :type => :view do
  before(:each) do
    @stage_status_code = assign(:stage_status_code, StageStatusCode.create!(
      :short_code => "Short Code",
      :description => "Description",
      :sequence => 1.5,
      :runner_status_code_id => 1,
      :support_status_code_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Code/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
