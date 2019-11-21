class AuthenticateController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def login
  	@username = params[:username]
  	@password = params[:password]
  	if (valid_credentials?(@username, @password))
  		flash[:notice] = 'Succesfully signed in.'
  		redirect_to parser_index_path
	else
        flash[:alert] = "Invalid credentials entered. please try again."
    	redirect_to root_path
    end
  end

  def valid_credentials?(u,p)
  	true
  end

end
