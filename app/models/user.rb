class User < ActiveRecord::Base
	has_many :ships
	has_many :relationships, foreign_key: :followed_id
	has_many :followed, through: :relationships, source: :followed

	validates_uniqueness_of :email
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "100x100" }, :default_url => "/avatar.jpeg"

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
end
