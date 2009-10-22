require 'test_helper'

class RunnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create runner" do
    assert_difference('Runner.count') do
      post :create, :runner => { }
    end

    assert_redirected_to runner_path(assigns(:runner))
  end

  test "should show runner" do
    get :show, :id => runners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => runners(:one).to_param
    assert_response :success
  end

  test "should update runner" do
    put :update, :id => runners(:one).to_param, :runner => { }
    assert_redirected_to runner_path(assigns(:runner))
  end

  test "should destroy runner" do
    assert_difference('Runner.count', -1) do
      delete :destroy, :id => runners(:one).to_param
    end

    assert_redirected_to runners_path
  end
end
