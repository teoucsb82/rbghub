class CharactersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.order("name asc")

  end

  # GET /characters/1
  # GET /characters/1.json
  def show    
    @character.ilvl = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["items"]["averageItemLevelEquipped"]    
    @character.cr = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["pvp"]["brackets"]["ARENA_BRACKET_RBG"]["rating"]
    @character.pvppower = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["stats"]["pvpPowerRating"]
    
    @character.gender = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name)["gender"]
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
    @character.gender = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name)["gender"]
    @character.cls = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["class"]
    @character.race = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["race"]
    @character.ilvl = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["items"]["averageItemLevelEquipped"]
    @character.cr = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["pvp"]["brackets"]["ARENA_BRACKET_RBG"]["rating"]    
    @character.pvppower = HTTParty.get("http://us.battle.net/api/wow/character/" + @character.realm + "/" + @character.name + "?fields=stats,pvp,items")["stats"]["pvpPowerRating"]
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
end
