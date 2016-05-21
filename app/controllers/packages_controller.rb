class PackagesController < ApplicationController

	def new 
		@route = []
		5.times do 
			@route << Package.new
		end
	end

		def create
			params["packages"].each do |package|
				if package["address"] != ""
					@pack = Package.create(package_params(package))					
				end
		#if !@pack.nil?
		#	flash[:success] = "Locations added! The shortest route is #{optimized order}"
		#else
		#	flash[:warning] = package.errors.full_messages.each {|error| puts error}
		#end
		
		end			

      	redirect_to root_url
	end

	private
	 def package_params(my_params)
    my_params.permit(:address)
 	end

end
