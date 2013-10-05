class TeamsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = current_user.teams.new
  end

  # GET /teams/1/edit
  def edit
    @team = current_user.teams.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = current_user.teams.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    @team = current_user.teams.find(params[:id])
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = current_user.teams.find(params[:id])
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :role1, :role2, :role3, :role4, :role5, :role6, :role7, :role8, :role9, :role10, :rbgdate, :rbghour, :rbgmin, :rbgzone, :rbgdurationHour, :rbgdurationMin, :isAvailable, :recurs, :rolesNeeded, :classesNeeded, :listed, :description, :mincr, :minilvl, :min2s, :min3s, :min5s, :mintitle)
    end
end