class MapsController < ApplicationController
		def home
			@proof = Proof.new#(proof_params)
			p_a = []
			Proof.all.each do |p|
			p_a << [p.latitude, p.longitude, p.taken_at]
			end
			
			gon.exif = p_a
		end



	private 
		def proof_params
		#	params.require(:proof).permit(:picture)
		end

end
