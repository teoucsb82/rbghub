class Team < ActiveRecord::Base

	attr_accessible :name, :role1, :role2, :role3, :role4, :role5, :role6, :role7, :role8, :role9, :role10, :rbgdate, :rbghour, :rbgmin, :rbgzone, :rbgdurationHour, :rbgdurationMin, :isAvailable, :recurs, :rolesNeeded, :classesNeeded, :listed, :description

	belongs_to :user

	validates :name, presence: true
	validates_length_of :description, :maximum => 100, :allow_blank => true

end
