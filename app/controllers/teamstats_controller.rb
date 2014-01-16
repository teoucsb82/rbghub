class TeamstatsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :new, :create]
  before_action :set_teamstat, only: [:show, :edit, :update, :destroy]

  # GET /teamstats
  # GET /teamstats.json
  def index
    @teamstat = Teamstat.new
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

  def add_toon(toonrealm)
    toon = toonrealm.split('-')[0].downcase
    realm = toonrealm.split('-')[1].nil? ? "" : toonrealm.split('-')[1].downcase
  
    realm = "Area-52" if realm=="area52"
    realm = "Khaz-modan" if realm=="khazmodan"
    realm = "Aerie-Peak" if realm=="aeriepeak"
    realm = "Altar-of-storms" if realm=="altarofstorms"
    realm = "Argent-Dawn" if realm=="argentdawn"
    realm = "Azjol-Nerub" if realm=="azjolnerub"
    realm = "Black-Dragonflight" if realm=="blackdragonflight"
    realm = "Blackwater-Raiders" if realm=="blackwaterraiders"
    realm = "Blackwing-Lair" if realm=="blackwinglair"
    realm = "Bleeding-Hollow" if realm=="bleedinghollow"
    realm = "Blood-Furnace" if realm=="bloodfurnace"
    realm = "Borean-Tundra" if realm=="boreantundra"
    realm = "Burning-Blade" if realm=="burningblade"
    realm = "Burning-Legion" if realm=="burninglegion"
    realm = "Cenarion-Circle" if realm=="cenarioncircle"
    realm = "Dark-Iron" if realm=="darkiron"
    realm = "Demon-Soul" if realm=="demonsoul"
    realm = "Earthen-Ring" if realm=="earthenring"
    realm = "Echo-Isles" if realm=="echoisles"
    realm = "Emerald-Dream" if realm=="emeralddream"
    realm = "Grizzly-Hills" if realm=="grizzlyhills"
    realm = "Khaz-Modan" if realm=="khazmodan"
    realm = "Kirin-Tor" if realm=="kirin-tor"
    realm = "The-Forgotten-Coast" if realm=="theforgottencoast"


    encoded_url = @teamstat.european? ? URI.encode("http://eu.battle.net/api/wow/character/" + realm + "/" + toon + "?fields=stats,pvp,items,achievements,talents") : URI.encode("http://us.battle.net/api/wow/character/" + realm + "/" + toon + "?fields=stats,pvp,items,achievements,talents")
    URI.parse(encoded_url)
    armory = HTTParty.get(encoded_url).to_h


    unless @teamstat.toon_db.include?(armory) || realm == ""
      @teamstat.toon_db[@counter] = armory
      @counter += 1
    end

  end

  # POST /teamstats
  # POST /teamstats.json
  def create
    @counter = 0
    @teamstat = Teamstat.new(teamstat_params)

    @teamstat.toon_db = @teamstat.input.strip.split(/[\r\n ,]+/)
    @teamstat.toon_db.pop if @teamstat.toon_db[-1]=="\r\n"
    
    @teamstat.toon_db.each { |toonrealm| add_toon(toonrealm)}

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
      params.require(:teamstat).permit(:input, :european, :toon_db)
    end
end
