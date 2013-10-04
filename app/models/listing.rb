class Listing < ActiveRecord::Base
	
	attr_accessible :description, :role, :listskype, :listbattletag, :toon, :as => [:default, :admin] 
end
