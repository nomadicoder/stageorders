require 'test_helper'

class SupportStatusCodesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_status_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_status_code" do
    assert_difference('SupportStatusCode.count') do
      post :create, :support_status_code => { }
    end

    assert_redirected_to support_status_code_path(assigns(:support_status_code))
  end

  test "should show support_status_code" do
    get :show, :id => support_status_codes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => support_status_codes(:one).to_param
    assert_response :success
  end

  test "should update support_status_code" do
    put :update, :id => support_status_codes(:one).to_param, :support_status_code => { }
    assert_redirected_to support_status_code_path(assigns(:support_status_code))
  end

  test "should destroy support_status_code" do
    assert_difference('SupportStatusCode.count', -1) do
      delete :destroy, :id => support_status_codes(:one).to_param
    end

    assert_redirected_to support_status_codes_path
  end
end
