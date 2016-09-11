require 'test_helper'

class InschoolsControllerTest < ActionController::TestCase
  setup do
    @inschool = inschools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inschools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inschool" do
    assert_difference('Inschool.count') do
      post :create, inschool: { administrator: @inschool.administrator, days: @inschool.days, end_date: @inschool.end_date, incident_date: @inschool.incident_date, reason: @inschool.reason, start_date: @inschool.start_date }
    end

    assert_redirected_to inschool_path(assigns(:inschool))
  end

  test "should show inschool" do
    get :show, id: @inschool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inschool
    assert_response :success
  end

  test "should update inschool" do
    put :update, id: @inschool, inschool: { administrator: @inschool.administrator, days: @inschool.days, end_date: @inschool.end_date, incident_date: @inschool.incident_date, reason: @inschool.reason, start_date: @inschool.start_date }
    assert_redirected_to inschool_path(assigns(:inschool))
  end

  test "should destroy inschool" do
    assert_difference('Inschool.count', -1) do
      delete :destroy, id: @inschool
    end

    assert_redirected_to inschools_path
  end
end
