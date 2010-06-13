require 'test_helper'

class FamilyUpdatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_update" do
    assert_difference('FamilyUpdate.count') do
      post :create, :family_update => { }
    end

    assert_redirected_to family_update_path(assigns(:family_update))
  end

  test "should show family_update" do
    get :show, :id => family_updates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => family_updates(:one).to_param
    assert_response :success
  end

  test "should update family_update" do
    put :update, :id => family_updates(:one).to_param, :family_update => { }
    assert_redirected_to family_update_path(assigns(:family_update))
  end

  test "should destroy family_update" do
    assert_difference('FamilyUpdate.count', -1) do
      delete :destroy, :id => family_updates(:one).to_param
    end

    assert_redirected_to family_updates_path
  end
end
