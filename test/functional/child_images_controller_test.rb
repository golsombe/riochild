require 'test_helper'

class ChildImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:child_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child_image" do
    assert_difference('ChildImage.count') do
      post :create, :child_image => { }
    end

    assert_redirected_to child_image_path(assigns(:child_image))
  end

  test "should show child_image" do
    get :show, :id => child_images(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => child_images(:one).to_param
    assert_response :success
  end

  test "should update child_image" do
    put :update, :id => child_images(:one).to_param, :child_image => { }
    assert_redirected_to child_image_path(assigns(:child_image))
  end

  test "should destroy child_image" do
    assert_difference('ChildImage.count', -1) do
      delete :destroy, :id => child_images(:one).to_param
    end

    assert_redirected_to child_images_path
  end
end
