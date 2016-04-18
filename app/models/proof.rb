class Proof < ActiveRecord::Base
	validates :picture, :longitude, :latitude, :taken_at, presence: true

	mount_uploader :picture, PictureUploader
	before_save :geolocate

	def geolocate 
		p = self.picture.path 
		self.longitude = EXIFR::JPEG.new(picture.path).gps.longitude
		self.latitude =  EXIFR::JPEG.new(picture.path).gps.latitude
		self.taken_at = EXIFR::JPEG.new(picture.path).date_time_original
	end
end
