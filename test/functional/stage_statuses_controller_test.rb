require 'test_helper'

class StageStatusesControllerTest < ActionController::TestCase
  setup do
    @stage_status = stage_statuses(:one)
  end

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
      post :create, stage_status: { runner_id: @stage_status.runner_id, runner_status_code_id: @stage_status.runner_status_code_id, stage_id: @stage_status.stage_id, stage_status_code_id: @stage_status.stage_status_code_id, support_status_code_id: @stage_status.support_status_code_id, support_unit_id: @stage_status.support_unit_id, team_id: @stage_status.team_id }
    end

    assert_redirected_to stage_status_path(assigns(:stage_status))
  end

  test "should show stage_status" do
    get :show, id: @stage_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stage_status
    assert_response :success
  end

  test "should update stage_status" do
    put :update, id: @stage_status, stage_status: { runner_id: @stage_status.runner_id, runner_status_code_id: @stage_status.runner_status_code_id, stage_id: @stage_status.stage_id, stage_status_code_id: @stage_status.stage_status_code_id, support_status_code_id: @stage_status.support_status_code_id, support_unit_id: @stage_status.support_unit_id, team_id: @stage_status.team_id }
    assert_redirected_to stage_status_path(assigns(:stage_status))
  end

  test "should destroy stage_status" do
    assert_difference('StageStatus.count', -1) do
      delete :destroy, id: @stage_status
    end

    assert_redirected_to stage_statuses_path
  end
end
