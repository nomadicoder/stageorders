require 'test_helper'

class StageStatusCodesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_status_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_status_code" do
    assert_difference('StageStatusCode.count') do
      post :create, :stage_status_code => { }
    end

    assert_redirected_to stage_status_code_path(assigns(:stage_status_code))
  end

  test "should show stage_status_code" do
    get :show, :id => stage_status_codes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stage_status_codes(:one).to_param
    assert_response :success
  end

  test "should update stage_status_code" do
    put :update, :id => stage_status_codes(:one).to_param, :stage_status_code => { }
    assert_redirected_to stage_status_code_path(assigns(:stage_status_code))
  end

  test "should destroy stage_status_code" do
    assert_difference('StageStatusCode.count', -1) do
      delete :destroy, :id => stage_status_codes(:one).to_param
    end

    assert_redirected_to stage_status_codes_path
  end
end
