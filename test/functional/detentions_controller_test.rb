require 'test_helper'

class DetentionsControllerTest < ActionController::TestCase
  setup do
    @detention = detentions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detentions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detention" do
    assert_difference('Detention.count') do
      post :create, detention: { administrator: @detention.administrator, detention_date: @detention.detention_date, incident_date: @detention.incident_date, reason: @detention.reason }
    end

    assert_redirected_to detention_path(assigns(:detention))
  end

  test "should show detention" do
    get :show, id: @detention
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detention
    assert_response :success
  end

  test "should update detention" do
    put :update, id: @detention, detention: { administrator: @detention.administrator, detention_date: @detention.detention_date, incident_date: @detention.incident_date, reason: @detention.reason }
    assert_redirected_to detention_path(assigns(:detention))
  end

  test "should destroy detention" do
    assert_difference('Detention.count', -1) do
      delete :destroy, id: @detention
    end

    assert_redirected_to detentions_path
  end
end
