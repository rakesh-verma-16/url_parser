require_relative '../helpers/parser_helper'
class ParserController < ApplicationController

	skip_before_action :verify_authenticity_token
	before_action :require_login

	def index
	end

	def parse
		input_url = params[:url]
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
		  flash[:error] = "You must be logged in to access this section"
		  redirect_to root_path # halts request cycle
		end
	end

	def validate_params
	  return false unless params[:url].present?
	end

end
