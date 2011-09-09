require 'test_helper'

class ChaptersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Chapter.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Chapter.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Chapter.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to chapter_url(assigns(:chapter))
  end

  def test_edit
    get :edit, :id => Chapter.first
    assert_template 'edit'
  end

  def test_update_invalid
    Chapter.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Chapter.first
    assert_template 'edit'
  end

  def test_update_valid
    Chapter.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Chapter.first
    assert_redirected_to chapter_url(assigns(:chapter))
  end

  def test_destroy
    chapter = Chapter.first
    delete :destroy, :id => chapter
    assert_redirected_to chapters_url
    assert !Chapter.exists?(chapter.id)
  end
end
