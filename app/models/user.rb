class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, #:recoverable,
		   :rememberable, :trackable, :validatable

	attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :skype, 
					:battletag, :haveMic, :addons, :aboutMe, :skill, :as => [:default, :admin]    

	validates :name, presence: true
  	validates :email,
    :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }   					     

    has_many :characters, :dependent => :destroy
    has_many :listings, :dependent => :destroy

end
