require 'test_helper'

class ChildUpdatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:child_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child_update" do
    assert_difference('ChildUpdate.count') do
      post :create, :child_update => { }
    end

    assert_redirected_to child_update_path(assigns(:child_update))
  end

  test "should show child_update" do
    get :show, :id => child_updates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => child_updates(:one).to_param
    assert_response :success
  end

  test "should update child_update" do
    put :update, :id => child_updates(:one).to_param, :child_update => { }
    assert_redirected_to child_update_path(assigns(:child_update))
  end

  test "should destroy child_update" do
    assert_difference('ChildUpdate.count', -1) do
      delete :destroy, :id => child_updates(:one).to_param
    end

    assert_redirected_to child_updates_path
  end
end
