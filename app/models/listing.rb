class Listing < ActiveRecord::Base
	
	attr_accessible :description, :role, :listskype, :listbattletag, :toon, :btag, :as => [:default, :admin] 

	belongs_to :user

	validates :user_id, presence: true
	validates :toon, presence: true
end
