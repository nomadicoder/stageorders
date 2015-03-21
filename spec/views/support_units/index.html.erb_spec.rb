require 'rails_helper'

RSpec.describe "support_units/index", :type => :view do
  before(:each) do
    assign(:support_units, [
      SupportUnit.create!(
        :team_id => 1,
        :support_type_id => 2,
        :tac_callsign => "Tac Callsign",
        :ham_callsign => "Ham Callsign",
        :support_status_code_id => 3,
        :current_stage_id => 4,
        :location_lat => 1.5,
        :location_lon => 1.5
      ),
      SupportUnit.create!(
        :team_id => 1,
        :support_type_id => 2,
        :tac_callsign => "Tac Callsign",
        :ham_callsign => "Ham Callsign",
        :support_status_code_id => 3,
        :current_stage_id => 4,
        :location_lat => 1.5,
        :location_lon => 1.5
      )
    ])
  end

  it "renders a list of support_units" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Tac Callsign".to_s, :count => 2
    assert_select "tr>td", :text => "Ham Callsign".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
