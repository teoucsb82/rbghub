class Team < ActiveRecord::Base
	attr_accessible :name, :role1, :role2, :role3, :role4, :role5, :role6, :role7, :role8, :role9, :role10, :rbgdate, :rbghour, :rbgmin, :rbgzone, :rbgdurationHour, :rbgdurationMin, :isAvailable, :recurs, :rolesNeeded, :classesNeeded, :listed, :description, :mincr, :minilvl, :min2s, :min3s, :min5s, :mintitle

	belongs_to :user
	validates :user_id, presence: true

end