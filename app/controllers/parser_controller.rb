require_relative '../helpers/parser_helper'
require_relative '../helpers/authentication'
class ParserController < ApplicationController

	skip_before_action :verify_authenticity_token
	before_action :require_login

	def parse
		input_url = params[:url]
		input_url = input_url.gsub(' ', '%20')
		if (ParserHelper.valid_url?(input_url))
			@url = ParserHelper.parse_url(input_url)
			return
		end
		flash[:alert] = ParserHelper::INVALID_URL
		redirect_to parser_index_path	
	end

	private
 
	def require_login
		if (session[:user_id]).nil?
		  flash[:error] = Authentication::LOGIN_REQUIRED
		  redirect_to root_path
		end
	end
end
