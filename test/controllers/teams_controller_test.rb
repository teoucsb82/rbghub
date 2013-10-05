require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: { classesNeeded: @team.classesNeeded, description: @team.description, isAvailable: @team.isAvailable, listed: @team.listed, name: @team.name, rbgdate: @team.rbgdate, rbgdurationHour: @team.rbgdurationHour, rbgdurationMin: @team.rbgdurationMin, rbghour: @team.rbghour, rbgmin: @team.rbgmin, rbgzone: @team.rbgzone, recurs: @team.recurs, role10: @team.role10, role1: @team.role1, role2: @team.role2, role3: @team.role3, role4: @team.role4, role5: @team.role5, role6: @team.role6, role7: @team.role7, role8: @team.role8, role9: @team.role9, rolesNeeded: @team.rolesNeeded }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team, team: { classesNeeded: @team.classesNeeded, description: @team.description, isAvailable: @team.isAvailable, listed: @team.listed, name: @team.name, rbgdate: @team.rbgdate, rbgdurationHour: @team.rbgdurationHour, rbgdurationMin: @team.rbgdurationMin, rbghour: @team.rbghour, rbgmin: @team.rbgmin, rbgzone: @team.rbgzone, recurs: @team.recurs, role10: @team.role10, role1: @team.role1, role2: @team.role2, role3: @team.role3, role4: @team.role4, role5: @team.role5, role6: @team.role6, role7: @team.role7, role8: @team.role8, role9: @team.role9, rolesNeeded: @team.rolesNeeded }
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
end
