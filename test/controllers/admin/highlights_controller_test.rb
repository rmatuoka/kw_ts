require 'test_helper'

class Admin::HighlightsControllerTest < ActionController::TestCase
  setup do
    @admin_highlight = admin_highlights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_highlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_highlight" do
    assert_difference('Admin::Highlight.count') do
      post :create, admin_highlight: { active: @admin_highlight.active, ordem: @admin_highlight.ordem, published: @admin_highlight.published, subtitle: @admin_highlight.subtitle, title: @admin_highlight.title }
    end

    assert_redirected_to admin_highlight_path(assigns(:admin_highlight))
  end

  test "should show admin_highlight" do
    get :show, id: @admin_highlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_highlight
    assert_response :success
  end

  test "should update admin_highlight" do
    patch :update, id: @admin_highlight, admin_highlight: { active: @admin_highlight.active, ordem: @admin_highlight.ordem, published: @admin_highlight.published, subtitle: @admin_highlight.subtitle, title: @admin_highlight.title }
    assert_redirected_to admin_highlight_path(assigns(:admin_highlight))
  end

  test "should destroy admin_highlight" do
    assert_difference('Admin::Highlight.count', -1) do
      delete :destroy, id: @admin_highlight
    end

    assert_redirected_to admin_highlights_path
  end
end
