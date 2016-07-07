class UlocsController < ApplicationController
	def create
		@uloc = Uloc.new(uloc_params)
		if @uloc.save
			flash[:success] = "Location confirmed! Thank you!"
		else
			flash[:warning] = "An error occured with your location. Please try again"
		end
		redirect_to root_url
	end

	private	
		def uloc_params
	    params.require(:uloc).permit(:latitude, :longitude)
	 	end
end
