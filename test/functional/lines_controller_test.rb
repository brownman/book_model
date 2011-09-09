require 'test_helper'

class LinesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Line.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Line.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Line.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to line_url(assigns(:line))
  end

  def test_edit
    get :edit, :id => Line.first
    assert_template 'edit'
  end

  def test_update_invalid
    Line.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Line.first
    assert_template 'edit'
  end

  def test_update_valid
    Line.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Line.first
    assert_redirected_to line_url(assigns(:line))
  end

  def test_destroy
    line = Line.first
    delete :destroy, :id => line
    assert_redirected_to lines_url
    assert !Line.exists?(line.id)
  end
end
