class Member < ActiveRecord::Base
	has_many :ideas
	has_many :likes
=begin
	validates_presence_of :fullname #, :message => "Please enter your full name"
	validates_presence_of :email #, :message => "Email address not filled"
	validates_presence_of :username #, :message => "Username not filled"
    validates_uniqueness_of :username, :allow_blank => false #, :message => "Username has been taken"
    validates_uniqueness_of :email, :allow_blank => false #, :message => "Email address has been used"
    validates :password, length: { minimum: 4, maximum: 16 } #, :message => "Password must be 4 to 16 characters"
=end
	validates :fullname, :presence => { :message => "please enter your full name" }
	validates :email, :presence => { :message => "email field is required" }
	validates :email, :uniqueness => { :message => "email address has been used" }
	validates :username, :presence => { :message => "username not filled" }
	validates :username, :uniqueness => { :message => "username has been taken" }
	validates :password, :presence => { :message => "please choose a valid password" }
	validates :password, :confirmation => { :message => "password miss-match" }
end