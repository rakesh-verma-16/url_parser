require_relative '../helpers/parser_helper'
class ParserController < ApplicationController

	skip_before_action :verify_authenticity_token

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

	def validate_params
	  return false unless params[:url].present?
	end

end
