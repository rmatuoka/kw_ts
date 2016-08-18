require 'test_helper'

class Admin::OrganizationsControllerTest < ActionController::TestCase
  setup do
    @admin_organization = admin_organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_organization" do
    assert_difference('Admin::Organization.count') do
      post :create, admin_organization: { description: @admin_organization.description, organization_finish: @admin_organization.organization_finish, organization_start: @admin_organization.organization_start, title: @admin_organization.title }
    end

    assert_redirected_to admin_organization_path(assigns(:admin_organization))
  end

  test "should show admin_organization" do
    get :show, id: @admin_organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_organization
    assert_response :success
  end

  test "should update admin_organization" do
    patch :update, id: @admin_organization, admin_organization: { description: @admin_organization.description, organization_finish: @admin_organization.organization_finish, organization_start: @admin_organization.organization_start, title: @admin_organization.title }
    assert_redirected_to admin_organization_path(assigns(:admin_organization))
  end

  test "should destroy admin_organization" do
    assert_difference('Admin::Organization.count', -1) do
      delete :destroy, id: @admin_organization
    end

    assert_redirected_to admin_organizations_path
  end
end
