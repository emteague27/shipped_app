class Ship < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  validates_presence_of :name, :length, :ship_type, :container_no, :location
  validates_uniqueness_of :name 
end
