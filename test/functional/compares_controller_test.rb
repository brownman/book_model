require 'test_helper'

class ComparesControllerTest < ActionController::TestCase
  setup do
    @compare = compares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compare" do
    assert_difference('Compare.count') do
      post :create, :compare => @compare.attributes
    end

    assert_redirected_to compare_path(assigns(:compare))
  end

  test "should show compare" do
    get :show, :id => @compare.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @compare.to_param
    assert_response :success
  end

  test "should update compare" do
    put :update, :id => @compare.to_param, :compare => @compare.attributes
    assert_redirected_to compare_path(assigns(:compare))
  end

  test "should destroy compare" do
    assert_difference('Compare.count', -1) do
      delete :destroy, :id => @compare.to_param
    end

    assert_redirected_to compares_path
  end
end
