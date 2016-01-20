class User < ActiveRecord::Base
	has_many :ships

	validates_uniqueness_of :email
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create
end
