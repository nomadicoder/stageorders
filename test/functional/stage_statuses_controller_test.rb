require 'test_helper'

class StageStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_status" do
    assert_difference('StageStatus.count') do
      post :create, :stage_status => { }
    end

    assert_redirected_to stage_status_path(assigns(:stage_status))
  end

  test "should show stage_status" do
    get :show, :id => stage_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stage_statuses(:one).to_param
    assert_response :success
  end

  test "should update stage_status" do
    put :update, :id => stage_statuses(:one).to_param, :stage_status => { }
    assert_redirected_to stage_status_path(assigns(:stage_status))
  end

  test "should destroy stage_status" do
    assert_difference('StageStatus.count', -1) do
      delete :destroy, :id => stage_statuses(:one).to_param
    end

    assert_redirected_to stage_statuses_path
  end
end
