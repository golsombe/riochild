require File.dirname(__FILE__) + '/../test_helper'

class ChildTeachersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:child_teachers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_child_teacher
    assert_difference('ChildTeacher.count') do
      post :create, :child_teacher => { }
    end

    assert_redirected_to child_teacher_path(assigns(:child_teacher))
  end

  def test_should_show_child_teacher
    get :show, :id => child_teachers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => child_teachers(:one).id
    assert_response :success
  end

  def test_should_update_child_teacher
    put :update, :id => child_teachers(:one).id, :child_teacher => { }
    assert_redirected_to child_teacher_path(assigns(:child_teacher))
  end

  def test_should_destroy_child_teacher
    assert_difference('ChildTeacher.count', -1) do
      delete :destroy, :id => child_teachers(:one).id
    end

    assert_redirected_to child_teachers_path
  end
end
