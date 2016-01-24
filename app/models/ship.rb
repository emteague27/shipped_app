class Ship < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  has_many :relationships, foreign_key: :user_id
  has_many :followers, through: :relationships, source: :follower

  validates_presence_of :name, :length, :ship_type, :container_no, :location
  validates_uniqueness_of :name 

  has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "100x100" }, :default_url => "/ship-d.jpg"

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
