class CharactersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json

  def index
    @characters = Character.order(sort_column + ' ' + sort_direction)
    
  end


  # GET /characters/1
  # GET /characters/1.json
  def show    

    armory = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items,achievements")
    @character.ilvl = armory["items"]["averageItemLevelEquipped"]    
    @character.cr = armory["pvp"]["brackets"]["ARENA_BRACKET_RBG"]["rating"]
    @character.arena2 = armory["pvp"]["brackets"]["ARENA_BRACKET_2v2"]["rating"]
    @character.arena3 = armory["pvp"]["brackets"]["ARENA_BRACKET_3v3"]["rating"]
    @character.arena5 = armory["pvp"]["brackets"]["ARENA_BRACKET_5v5"]["rating"]
    @character.pvppower = armory["stats"]["pvpPowerRating"]
    @character.pvpresil = armory["stats"]["pvpResilienceRating"]
    @character.hk = armory["totalHonorableKills"]
    @character.health = armory["stats"]["health"]
    @character.armor = armory["stats"]["armor"]
    @character.str = armory["stats"]["str"]
    @character.agi = armory["stats"]["agi"]
    @character.int = armory["stats"]["int"]
    @character.spr = armory["stats"]["spr"]
    @character.ap = armory["stats"]["attackPower"]
    @character.sp = armory["stats"]["spellPower"]
    @character.mastery = armory["stats"]["masteryRating"]
    @character.masteryp = armory["stats"]["mastery"]
    @character.crit = armory["stats"]["critRating"]
    @character.critp = armory["stats"]["crit"]
    @character.haste = armory["stats"]["hasteRating"]
    @character.hastep = armory["stats"]["haste"]

    @achievements = armory["achievements"]["achievementsCompleted"]
    
    #2s achieves
    if @achievements.include? 1159
      @character.achv2 = 2200
    elsif @achievements.include? 401
      @character.achv2 = 2000
    elsif @achievements.include? 400
      @character.achv2 = 1750
    elsif @achievements.include? 399
      @character.achv2 = 1550
    end
    
    #3s achieves
    if @achievements.include? 5267
      @character.achv3 = 2700
    elsif @achievements.include? 5266
      @character.achv3 = 2400
    elsif @achievements.include? 1160
      @character.achv3 = 2200
    elsif @achievements.include? 405
      @character.achv3 = 2000
    elsif @achievements.include? 403
      @character.achv3 = 1750
    elsif @achievements.include? 402
      @character.achv3 = 1550
    end
        
    #5s achieves
    if @achievements.include? 1161
      @character.achv5 = 2200
    elsif @achievements.include? 404
      @character.achv5 = 2000
    elsif @achievements.include? 407
      @character.achv5 = 1750
    elsif @achievements.include? 406
      @character.achv5 = 1550
    end

    #PVP Titles
    if @achievements.include? 2091
      @character.bgtitle = "Gladiator"
    elsif @achievements.include? 2092
      @character.bgtitle = "Duelist"
    elsif @achievements.include? 2093
      @character.bgtitle = "Rival"
    elsif @achievements.include? 2090
      @character.bgtitle = "Challenger"
    end

    #ArenaMaster Title
    if @achievements.include? 1174
      @character.arenamaster = true
    end

    @character.save
  end

  # GET /characters/new
  def new
    @character = current_user.characters.new
  end

  # GET /characters/1/edit
  def edit
    @characters = current_user.characters.find(params[:id])
    @character.name.capitalize!
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = current_user.characters.new(character_params)
    @character.name.capitalize!
    armory = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")
    @character.arenamaster = false
    @character.gender = armory["gender"]
    @character.cls = armory["class"]
    @character.race = armory["race"]
    @character.ilvl = armory["items"]["averageItemLevelEquipped"]
    @character.cr = armory["pvp"]["brackets"]["ARENA_BRACKET_RBG"]["rating"]    
    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character }
      else
        format.html { render action: 'new' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = current_user.characters.find(params[:id])
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :realm)
    end

    private
      def sort_column
        Character.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end
      
      def sort_direction
        %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
      end


end
