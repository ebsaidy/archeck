class AuthenticationController < ApplicationController
		include ActionController::ImplicitRender
		respond_to :json

		def login
		    user = User.find_by(name: params[:name])
		    if user and user.authenticate(params[:password])
		      
		      @authenticated = {"status" => true, "location" => user.location}      
		    else
		      @authenticated = {"status" => false}
		  	end
		  	render xml: @authenticated, root: 'objects', children: 'object'
		end
end