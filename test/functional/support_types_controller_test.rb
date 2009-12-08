require 'test_helper'

class SupportTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_type" do
    assert_difference('SupportType.count') do
      post :create, :support_type => { }
    end

    assert_redirected_to support_type_path(assigns(:support_type))
  end

  test "should show support_type" do
    get :show, :id => support_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => support_types(:one).to_param
    assert_response :success
  end

  test "should update support_type" do
    put :update, :id => support_types(:one).to_param, :support_type => { }
    assert_redirected_to support_type_path(assigns(:support_type))
  end

  test "should destroy support_type" do
    assert_difference('SupportType.count', -1) do
      delete :destroy, :id => support_types(:one).to_param
    end

    assert_redirected_to support_types_path
  end
end
