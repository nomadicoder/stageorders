require 'rails_helper'

RSpec.describe "support_units/edit", :type => :view do
  before(:each) do
    @support_unit = assign(:support_unit, SupportUnit.create!(
      :team_id => 1,
      :support_type_id => 1,
      :tac_callsign => "MyString",
      :ham_callsign => "MyString",
      :support_status_code_id => 1,
      :current_stage_id => 1,
      :location_lat => 1.5,
      :location_lon => 1.5
    ))
  end

  it "renders the edit support_unit form" do
    render

    assert_select "form[action=?][method=?]", support_unit_path(@support_unit), "post" do

      assert_select "input#support_unit_team_id[name=?]", "support_unit[team_id]"

      assert_select "input#support_unit_support_type_id[name=?]", "support_unit[support_type_id]"

      assert_select "input#support_unit_tac_callsign[name=?]", "support_unit[tac_callsign]"

      assert_select "input#support_unit_ham_callsign[name=?]", "support_unit[ham_callsign]"

      assert_select "input#support_unit_support_status_code_id[name=?]", "support_unit[support_status_code_id]"

      assert_select "input#support_unit_current_stage_id[name=?]", "support_unit[current_stage_id]"

      assert_select "input#support_unit_location_lat[name=?]", "support_unit[location_lat]"

      assert_select "input#support_unit_location_lon[name=?]", "support_unit[location_lon]"
    end
  end
end
