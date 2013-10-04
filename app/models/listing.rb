class Listing < ActiveRecord::Base
	
	attr_accessible :description, :role, :listskype, :listbattletag, :toon, :btag, :as => [:default, :admin] 

	belongs_to :user

	validates :user_id, presence: true
	validates :toon, presence: true
	validates :role, presence: true
	validates_length_of :description, :maximum => 100, :allow_blank => true
end
