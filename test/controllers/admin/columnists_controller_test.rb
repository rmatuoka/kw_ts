require 'test_helper'

class Admin::ColumnistsControllerTest < ActionController::TestCase
  setup do
    @admin_columnist = admin_columnists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_columnists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_columnist" do
    assert_difference('Admin::Columnist.count') do
      post :create, admin_columnist: { active: @admin_columnist.active, description: @admin_columnist.description, name: @admin_columnist.name, published: @admin_columnist.published }
    end

    assert_redirected_to admin_columnist_path(assigns(:admin_columnist))
  end

  test "should show admin_columnist" do
    get :show, id: @admin_columnist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_columnist
    assert_response :success
  end

  test "should update admin_columnist" do
    patch :update, id: @admin_columnist, admin_columnist: { active: @admin_columnist.active, description: @admin_columnist.description, name: @admin_columnist.name, published: @admin_columnist.published }
    assert_redirected_to admin_columnist_path(assigns(:admin_columnist))
  end

  test "should destroy admin_columnist" do
    assert_difference('Admin::Columnist.count', -1) do
      delete :destroy, id: @admin_columnist
    end

    assert_redirected_to admin_columnists_path
  end
end
