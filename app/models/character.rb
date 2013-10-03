class Character < ActiveRecord::Base
	attr_accessible :name, :realm

	validates :name, presence: true
	validates :realm, presence: true
end
