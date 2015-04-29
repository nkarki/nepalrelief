require 'test_helper'

class NeededItemsControllerTest < ActionController::TestCase
  setup do
    @needed_item = needed_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:needed_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create needed_item" do
    assert_difference('NeededItem.count') do
      post :create, needed_item: {  }
    end

    assert_redirected_to needed_item_path(assigns(:needed_item))
  end

  test "should show needed_item" do
    get :show, id: @needed_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @needed_item
    assert_response :success
  end

  test "should update needed_item" do
    patch :update, id: @needed_item, needed_item: {  }
    assert_redirected_to needed_item_path(assigns(:needed_item))
  end

  test "should destroy needed_item" do
    assert_difference('NeededItem.count', -1) do
      delete :destroy, id: @needed_item
    end

    assert_redirected_to needed_items_path
  end
end
