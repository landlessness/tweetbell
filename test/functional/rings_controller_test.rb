require 'test_helper'

class RingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Ring.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Ring.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Ring.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ring_url(assigns(:ring))
  end

  def test_edit
    get :edit, :id => Ring.first
    assert_template 'edit'
  end

  def test_update_invalid
    Ring.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ring.first
    assert_template 'edit'
  end

  def test_update_valid
    Ring.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ring.first
    assert_redirected_to ring_url(assigns(:ring))
  end

  def test_destroy
    ring = Ring.first
    delete :destroy, :id => ring
    assert_redirected_to rings_url
    assert !Ring.exists?(ring.id)
  end
end
