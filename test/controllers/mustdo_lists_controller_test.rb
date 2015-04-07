require 'test_helper'

class MustdoListsControllerTest < ActionController::TestCase
  setup do
    @mustdo_list = mustdo_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mustdo_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mustdo_list" do
    assert_difference('MustdoList.count') do
      post :create, mustdo_list: { category: @mustdo_list.category, description: @mustdo_list.description, title: @mustdo_list.title }
    end

    assert_redirected_to mustdo_list_path(assigns(:mustdo_list))
  end

  test "should show mustdo_list" do
    get :show, id: @mustdo_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mustdo_list
    assert_response :success
  end

  test "should update mustdo_list" do
    patch :update, id: @mustdo_list, mustdo_list: { category: @mustdo_list.category, description: @mustdo_list.description, title: @mustdo_list.title }
    assert_redirected_to mustdo_list_path(assigns(:mustdo_list))
  end

  test "should destroy mustdo_list" do
    assert_difference('MustdoList.count', -1) do
      delete :destroy, id: @mustdo_list
    end

    assert_redirected_to mustdo_lists_path
  end
end
