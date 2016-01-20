class Job < ActiveRecord::Base
  belongs_to :ship

 	validates_presence_of :job_name, :containers_needed, :cost, :cargo
 	validates_uniqueness_of :job_name
 	validates_length_of :cargo, :minimum => 50, :allow_blank => false 
 	validates_numericality_of :cost, :greater_than_or_equal_to => 1000.00
end
