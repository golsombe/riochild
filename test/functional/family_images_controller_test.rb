require 'test_helper'

class FamilyImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_image" do
    assert_difference('FamilyImage.count') do
      post :create, :family_image => { }
    end

    assert_redirected_to family_image_path(assigns(:family_image))
  end

  test "should show family_image" do
    get :show, :id => family_images(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => family_images(:one).to_param
    assert_response :success
  end

  test "should update family_image" do
    put :update, :id => family_images(:one).to_param, :family_image => { }
    assert_redirected_to family_image_path(assigns(:family_image))
  end

  test "should destroy family_image" do
    assert_difference('FamilyImage.count', -1) do
      delete :destroy, :id => family_images(:one).to_param
    end

    assert_redirected_to family_images_path
  end
end
