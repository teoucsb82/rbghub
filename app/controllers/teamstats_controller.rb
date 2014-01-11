class TeamstatsController < ApplicationController
  before_action :set_teamstat, only: [:show, :edit, :update, :destroy]

  # GET /teamstats
  # GET /teamstats.json
  def index
    @teamstats = Teamstat.all
  end

  # GET /teamstats/1
  # GET /teamstats/1.json
  def show
  end

  # GET /teamstats/new
  def new
    @teamstat = Teamstat.new
  end

  # GET /teamstats/1/edit
  def edit
  end

  # POST /teamstats
  # POST /teamstats.json
  def create
    @teamstat = Teamstat.new(teamstat_params)

    respond_to do |format|
      if @teamstat.save
        format.html { redirect_to @teamstat, notice: 'Teamstat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @teamstat }
      else
        format.html { render action: 'new' }
        format.json { render json: @teamstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teamstats/1
  # PATCH/PUT /teamstats/1.json
  def update
    respond_to do |format|
      if @teamstat.update(teamstat_params)
        format.html { redirect_to @teamstat, notice: 'Teamstat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @teamstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teamstats/1
  # DELETE /teamstats/1.json
  def destroy
    @teamstat.destroy
    respond_to do |format|
      format.html { redirect_to teamstats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teamstat
      @teamstat = Teamstat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teamstat_params
      params.require(:teamstat).permit(:input)
    end
end
