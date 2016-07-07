class PackagesController < ApplicationController

	def new 
		@route = []
		5.times do 
			@route << Package.new
		end
	end

		def create
			params["packages"].each do |package|
				if package["address"] != "" #does not add empty form fields
					@pack = Package.create(package_params(package))					
				end
		end			

      	redirect_to root_url
	end

	private
	def package_params(my_params)
    my_params.permit(:address)
 	end

end
