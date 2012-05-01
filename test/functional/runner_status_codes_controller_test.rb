require 'test_helper'

class RunnerStatusCodesControllerTest < ActionController::TestCase
  setup do
    @runner_status_code = runner_status_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runner_status_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runner_status_code" do
    assert_difference('RunnerStatusCode.count') do
      post :create, runner_status_code: { description: @runner_status_code.description, sequence: @runner_status_code.sequence, short_code: @runner_status_code.short_code }
    end

    assert_redirected_to runner_status_code_path(assigns(:runner_status_code))
  end

  test "should show runner_status_code" do
    get :show, id: @runner_status_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @runner_status_code
    assert_response :success
  end

  test "should update runner_status_code" do
    put :update, id: @runner_status_code, runner_status_code: { description: @runner_status_code.description, sequence: @runner_status_code.sequence, short_code: @runner_status_code.short_code }
    assert_redirected_to runner_status_code_path(assigns(:runner_status_code))
  end

  test "should destroy runner_status_code" do
    assert_difference('RunnerStatusCode.count', -1) do
      delete :destroy, id: @runner_status_code
    end

    assert_redirected_to runner_status_codes_path
  end
end
