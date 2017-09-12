require 'test_helper'

class AssetClassesControllerTest < ActionController::TestCase
  setup do
    @asset_class = asset_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_class" do
    assert_difference('AssetClass.count') do
      post :create, asset_class: { name: @asset_class.name }
    end

    assert_redirected_to asset_class_path(assigns(:asset_class))
  end

  test "should show asset_class" do
    get :show, id: @asset_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_class
    assert_response :success
  end

  test "should update asset_class" do
    patch :update, id: @asset_class, asset_class: { name: @asset_class.name }
    assert_redirected_to asset_class_path(assigns(:asset_class))
  end

  test "should destroy asset_class" do
    assert_difference('AssetClass.count', -1) do
      delete :destroy, id: @asset_class
    end

    assert_redirected_to asset_classes_path
  end
end
