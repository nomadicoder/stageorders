require 'rails_helper'

RSpec.describe "support_units/show", :type => :view do
  before(:each) do
    @support_unit = assign(:support_unit, SupportUnit.create!(
      :team_id => 1,
      :support_type_id => 2,
      :tac_callsign => "Tac Callsign",
      :ham_callsign => "Ham Callsign",
      :support_status_code_id => 3,
      :current_stage_id => 4,
      :location_lat => 1.5,
      :location_lon => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Tac Callsign/)
    expect(rendered).to match(/Ham Callsign/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
