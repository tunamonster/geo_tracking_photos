class MapsController < ApplicationController
		def home
			@proof = Proof.new#(proof_params)
			@route = []
			5.times do 
				@route << Package.new
			end

			gon.exif = []
			Proof.all.each { |p| gon.exif << [p.latitude, p.longitude, p.taken_at, p.picture.url] }

			@oo = optimized_order
			@group = []
				
			@map_route = []
			optimized_order.each {|coords| @map_route << [coords[2], coords[1]]} #[gon.route << address, lat, long]
		end



	private 
		def proof_params
		#	params.require(:proof).permit(:picture)
		end

end
