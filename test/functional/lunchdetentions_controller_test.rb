require 'test_helper'

class LunchdetentionsControllerTest < ActionController::TestCase
  setup do
    @lunchdetention = lunchdetentions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lunchdetentions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lunchdetention" do
    assert_difference('Lunchdetention.count') do
      post :create, lunchdetention: { administrator: @lunchdetention.administrator, days: @lunchdetention.days, end_date: @lunchdetention.end_date, incident_date: @lunchdetention.incident_date, reason: @lunchdetention.reason, start_date: @lunchdetention.start_date }
    end

    assert_redirected_to lunchdetention_path(assigns(:lunchdetention))
  end

  test "should show lunchdetention" do
    get :show, id: @lunchdetention
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lunchdetention
    assert_response :success
  end

  test "should update lunchdetention" do
    put :update, id: @lunchdetention, lunchdetention: { administrator: @lunchdetention.administrator, days: @lunchdetention.days, end_date: @lunchdetention.end_date, incident_date: @lunchdetention.incident_date, reason: @lunchdetention.reason, start_date: @lunchdetention.start_date }
    assert_redirected_to lunchdetention_path(assigns(:lunchdetention))
  end

  test "should destroy lunchdetention" do
    assert_difference('Lunchdetention.count', -1) do
      delete :destroy, id: @lunchdetention
    end

    assert_redirected_to lunchdetentions_path
  end
end
