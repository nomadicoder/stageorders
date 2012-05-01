require 'test_helper'

class StageStatusCodesControllerTest < ActionController::TestCase
  setup do
    @stage_status_code = stage_status_codes(:one)
  end

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
      post :create, stage_status_code: { description: @stage_status_code.description, runner_status_code_id: @stage_status_code.runner_status_code_id, sequence: @stage_status_code.sequence, short_code: @stage_status_code.short_code, support_status_code_id: @stage_status_code.support_status_code_id }
    end

    assert_redirected_to stage_status_code_path(assigns(:stage_status_code))
  end

  test "should show stage_status_code" do
    get :show, id: @stage_status_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stage_status_code
    assert_response :success
  end

  test "should update stage_status_code" do
    put :update, id: @stage_status_code, stage_status_code: { description: @stage_status_code.description, runner_status_code_id: @stage_status_code.runner_status_code_id, sequence: @stage_status_code.sequence, short_code: @stage_status_code.short_code, support_status_code_id: @stage_status_code.support_status_code_id }
    assert_redirected_to stage_status_code_path(assigns(:stage_status_code))
  end

  test "should destroy stage_status_code" do
    assert_difference('StageStatusCode.count', -1) do
      delete :destroy, id: @stage_status_code
    end

    assert_redirected_to stage_status_codes_path
  end
end
