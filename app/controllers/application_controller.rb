class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def optimized_order #calls Mapquest API to order input to minimize travel time

  if Package.count > 1 
      group = []
      anchor = Package.last.created_at
      lim = 5.seconds
       
      min = anchor - lim
      max =  anchor + lim 

      Package.where(created_at: min..max).each {|package| group << "#{package.address}"} 

      optimized_order = []
      Route.all.each do |route|
        optimized_order = route.order if route.order.sort == group.sort #search for match
      end

      optimized_locations = []

      if optimized_order != [] #route already calculated
        optimized_order.each do |loc|
          p = Package.where(address: loc).last
          optimized_locations << [p.address, p.latitude, p.longitude]
        end



      else #call mapquest api to calculate new route

      url = URI("http://www.mapquestapi.com/directions/v2/optimizedroute?key=sXUK5TTzyRju00qjsZ755oUZLCfB7LFS")
    	http = Net::HTTP.new(url.host, url.port)
    	request = Net::HTTP::Post.new(url)
    	request["cache-control"] = 'no-cache'
    	request["content-type"] = 'text/json'
    	request.body = "{locations: #{group} }"
    	response = http.request(request)

    	#handle response
    	response = JSON.parse(response.body)
    	optimized_order = response["route"]["locationSequence"]

      optimized_order.each do |index|
        p = Package.where(address: group[index]).last
        optimized_locations << [p.address, p.latitude, p.longitude]

        new_route = []
        optimized_locations.each {|loc| new_route << loc[0]} #address
       Route.create(order: new_route ) #save new route
        
    end

  end
  	return optimized_locations

  else 
    optimized_locations = []

  end

  end

end
 #group << startpoint

    #locations = [
#        '{ latLng: {lat: 39.637433, lng: -105.163867 }}',
#        '{ latLng: {lat: 39.743943, lng: -105.020089 }}'
#      ]
