require 'test_helper'

class TastersControllerTest < ActionController::TestCase
  setup do
    @taster = tasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taster" do
    assert_difference('Taster.count') do
      post :create, taster: { employee_id: @taster.employee_id }
    end

    assert_redirected_to taster_path(assigns(:taster))
  end

  test "should show taster" do
    get :show, id: @taster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taster
    assert_response :success
  end

  test "should update taster" do
    patch :update, id: @taster, taster: { employee_id: @taster.employee_id }
    assert_redirected_to taster_path(assigns(:taster))
  end

  test "should destroy taster" do
    assert_difference('Taster.count', -1) do
      delete :destroy, id: @taster
    end

    assert_redirected_to tasters_path
  end
end
