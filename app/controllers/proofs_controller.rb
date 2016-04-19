class ProofsController < ApplicationController
	def create
		@proof = Proof.new(proof_params)
		if @proof.save
			flash[:success] = "Photo uploaded at #{@proof.latitude}, #{@proof.longitude}"
		else
			flash[:error] = @proof.errors.full_messages	
		end
      redirect_to root_url
	end

	private 

	def proof_params
		params.require(:proof).permit(:picture, :longitude, :latitude)
	end
end
