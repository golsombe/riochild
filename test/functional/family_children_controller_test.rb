require 'test_helper'

class FamilyChildrenControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_child" do
    assert_difference('FamilyChild.count') do
      post :create, :family_child => { }
    end

    assert_redirected_to family_child_path(assigns(:family_child))
  end

  test "should show family_child" do
    get :show, :id => family_children(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => family_children(:one).to_param
    assert_response :success
  end

  test "should update family_child" do
    put :update, :id => family_children(:one).to_param, :family_child => { }
    assert_redirected_to family_child_path(assigns(:family_child))
  end

  test "should destroy family_child" do
    assert_difference('FamilyChild.count', -1) do
      delete :destroy, :id => family_children(:one).to_param
    end

    assert_redirected_to family_children_path
  end
end
