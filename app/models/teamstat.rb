class Teamstat < ActiveRecord::Base
   attr_accessible :input, :european
   serialize :toon_db

   validates :input, presence: true  

end