require 'test_helper'

class GradelevelsControllerTest < ActionController::TestCase
  setup do
    @gradelevel = gradelevels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gradelevels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gradelevel" do
    assert_difference('Gradelevel.count') do
      post :create, gradelevel: { gldate: @gradelevel.gldate, glincident_date: @gradelevel.glincident_date, glreason: @gradelevel.glreason, glteacher: @gradelevel.glteacher }
    end

    assert_redirected_to gradelevel_path(assigns(:gradelevel))
  end

  test "should show gradelevel" do
    get :show, id: @gradelevel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gradelevel
    assert_response :success
  end

  test "should update gradelevel" do
    put :update, id: @gradelevel, gradelevel: { gldate: @gradelevel.gldate, glincident_date: @gradelevel.glincident_date, glreason: @gradelevel.glreason, glteacher: @gradelevel.glteacher }
    assert_redirected_to gradelevel_path(assigns(:gradelevel))
  end

  test "should destroy gradelevel" do
    assert_difference('Gradelevel.count', -1) do
      delete :destroy, id: @gradelevel
    end

    assert_redirected_to gradelevels_path
  end
end
