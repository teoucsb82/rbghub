class Armory
  include HTTParty
 
 
  attr_accessor :name, :realm, :cls, :race
 
  def initialize(name, realm, cls, race)
    self.name = name
    self.realm = realm
    self.cls = cls
    self.race = race
  end
 
 
  # Find a particular gem, based on its name
  def self.find(name, realm)
    response = get("http://us.battle.net/api/wow/character/" + realm + "/" + name)
    if response.success?
      self.new(response["name"], response["realm"], response["cls"],
         response["race"])
    else
      # this just raises the net/http response that was raised


    end
  end
end