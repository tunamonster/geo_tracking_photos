class Proof < ActiveRecord::Base
	
	validates_presence_of :picture, message: "Please select a JPEG file" 
	validates_presence_of :longitude, message: "was not found in your file." 
	validates_presence_of :latitude, message: "was not found in your file." 
	validates_presence_of :taken_at, message: "was not found in your file." 
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
