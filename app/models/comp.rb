class Comp < ActiveRecord::Base
   attr_accessible :listplayers

   validates :listplayers, presence: true
end
