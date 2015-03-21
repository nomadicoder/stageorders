require 'rails_helper'

RSpec.describe "runners/show", :type => :view do
  before(:each) do
    @runner = assign(:runner, Runner.create!(
      :stage_id => 1,
      :team_id => 2,
      :runner_status_code_id => 3,
      :name => "Name",
      :completed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
