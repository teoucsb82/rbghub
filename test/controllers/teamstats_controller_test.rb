require 'test_helper'

class TeamstatsControllerTest < ActionController::TestCase
  setup do
    @teamstat = teamstats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teamstats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teamstat" do
    assert_difference('Teamstat.count') do
      post :create, teamstat: { input: @teamstat.input }
    end

    assert_redirected_to teamstat_path(assigns(:teamstat))
  end

  test "should show teamstat" do
    get :show, id: @teamstat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teamstat
    assert_response :success
  end

  test "should update teamstat" do
    patch :update, id: @teamstat, teamstat: { input: @teamstat.input }
    assert_redirected_to teamstat_path(assigns(:teamstat))
  end

  test "should destroy teamstat" do
    assert_difference('Teamstat.count', -1) do
      delete :destroy, id: @teamstat
    end

    assert_redirected_to teamstats_path
  end
end
