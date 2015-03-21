require 'rails_helper'

RSpec.describe "stage_statuses/show", :type => :view do
  before(:each) do
    @stage_status = assign(:stage_status, StageStatus.create!(
      :team_id => 1,
      :stage_id => 2,
      :runner_id => 3,
      :support_unit_id => 4,
      :runner_status_code_id => 5,
      :support_status_code_id => 6,
      :stage_status_code_id => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
  end
end
