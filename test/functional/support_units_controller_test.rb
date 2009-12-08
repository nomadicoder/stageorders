require 'test_helper'

class SupportUnitsControllerTest < ActionController::TestCase
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
      post :create, :support_unit => { }
    end

    assert_redirected_to support_unit_path(assigns(:support_unit))
  end

  test "should show support_unit" do
    get :show, :id => support_units(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => support_units(:one).to_param
    assert_response :success
  end

  test "should update support_unit" do
    put :update, :id => support_units(:one).to_param, :support_unit => { }
    assert_redirected_to support_unit_path(assigns(:support_unit))
  end

  test "should destroy support_unit" do
    assert_difference('SupportUnit.count', -1) do
      delete :destroy, :id => support_units(:one).to_param
    end

    assert_redirected_to support_units_path
  end
end
