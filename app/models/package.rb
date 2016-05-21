class Package < ActiveRecord::Base
	validates :address, presence: true
	before_create {
		coords = Geocoder.coordinates self.address
		self.longitude = coords[0]
		self.latitude = coords[1]
	}
end
