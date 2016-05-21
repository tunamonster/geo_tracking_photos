class Route < ActiveRecord::Base
	serialize :order
	validates :order, presence: true, uniqueness: true 
	#order unique
end
