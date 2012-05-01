require 'test_helper'

class SupportUnitsControllerTest < ActionController::TestCase
  setup do
    @support_unit = support_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_unit" do
    assert_difference('SupportUnit.count') do
      post :create, support_unit: { current_stage_id: @support_unit.current_stage_id, ham_callsign: @support_unit.ham_callsign, location_lat: @support_unit.location_lat, location_lon: @support_unit.location_lon, support_status_code_id: @support_unit.support_status_code_id, support_type_id: @support_unit.support_type_id, tac_callsign: @support_unit.tac_callsign, team_id: @support_unit.team_id }
    end

    assert_redirected_to support_unit_path(assigns(:support_unit))
  end

  test "should show support_unit" do
    get :show, id: @support_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_unit
    assert_response :success
  end

  test "should update support_unit" do
    put :update, id: @support_unit, support_unit: { current_stage_id: @support_unit.current_stage_id, ham_callsign: @support_unit.ham_callsign, location_lat: @support_unit.location_lat, location_lon: @support_unit.location_lon, support_status_code_id: @support_unit.support_status_code_id, support_type_id: @support_unit.support_type_id, tac_callsign: @support_unit.tac_callsign, team_id: @support_unit.team_id }
    assert_redirected_to support_unit_path(assigns(:support_unit))
  end

  test "should destroy support_unit" do
    assert_difference('SupportUnit.count', -1) do
      delete :destroy, id: @support_unit
    end

    assert_redirected_to support_units_path
  end
end
