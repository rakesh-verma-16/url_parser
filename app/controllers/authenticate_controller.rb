require_relative '../helpers/authentication'
class AuthenticateController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  before_action :already_logged_in, only: [:login]
  
  def index
  end

  def login
  	@username = params[:username]
  	@password = params[:password]
  	if (valid_credentials?(@username, @password))
      session[:user_id] = Authentication::USERNAME_IDS[@username]
  		flash[:notice] = 'Succesfully signed in.'
  		redirect_to parser_index_path
	  else
      flash[:alert] = "Invalid credentials entered. please try again."
    	redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out Succesfully'
    redirect_to root_path
  end

  private

  def already_logged_in
    unless session[:user_id].nil?
      redirect_to parser_index_path
    end
  end

  def valid_credentials?(username,pass)
  	unless Authentication::USERNAME_PASSWORDS.has_key?(username.to_s) && pass == Authentication::USERNAME_PASSWORDS.fetch(username).to_s
      return false
    end
    return true
  end

end
