class Proof < ActiveRecord::Base
	validates :picture, :longitude, :latitude, :taken_at, presence: true
	validates_uniqueness_of [:longitude, :latitude, :taken_at]
	mount_uploader :picture, PictureUploader
	before_validation :geolocate

	def geolocate 	
		p = EXIFR::JPEG.new(picture.path)
		
		self.longitude = p.gps.longitude if !p.gps.nil?
		self.latitude =  p.gps.latitude	if !p.gps.nil?
		self.taken_at = p.date_time_original if !p.date_time_original.nil?
	
	end
end
