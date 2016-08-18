require 'test_helper'

class Admin::EnterprisesControllerTest < ActionController::TestCase
  setup do
    @admin_enterprise = admin_enterprises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_enterprises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_enterprise" do
    assert_difference('Admin::Enterprise.count') do
      post :create, admin_enterprise: { description: @admin_enterprise.description, name: @admin_enterprise.name }
    end

    assert_redirected_to admin_enterprise_path(assigns(:admin_enterprise))
  end

  test "should show admin_enterprise" do
    get :show, id: @admin_enterprise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_enterprise
    assert_response :success
  end

  test "should update admin_enterprise" do
    patch :update, id: @admin_enterprise, admin_enterprise: { description: @admin_enterprise.description, name: @admin_enterprise.name }
    assert_redirected_to admin_enterprise_path(assigns(:admin_enterprise))
  end

  test "should destroy admin_enterprise" do
    assert_difference('Admin::Enterprise.count', -1) do
      delete :destroy, id: @admin_enterprise
    end

    assert_redirected_to admin_enterprises_path
  end
end
