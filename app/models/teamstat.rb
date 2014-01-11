class Teamstat < ActiveRecord::Base
   attr_accessible :input

   validates :input, presence: true
end
