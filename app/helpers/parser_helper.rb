require_relative 'regex_helper'
require_relative '../models/url_history'

module ParserHelper

	INVALID_URL = 'Invalid URL. Please try again with a valid URL.'
	
	private 

    ##
    # parameter: url string
    # Validates if url is valid or not.
    # returns boolean
    ##
	def self.valid_url?(url)
		url_regexp = RegexHelper.match_url_regex(url)
		url =~ url_regexp ? true : false
	end

	##
	# Parameter: url string
	# Parse a url and return the components
	# return mapping of components and values
	##
	def self.parse_url(url)
		uri = URI.parse(url)
		components = uri.instance_values
		if (!UrlHistory.insert(components))
			flash[:notice] = UrlHistory::UNABLE_TO_SAVE
		end
		return self.decode_components(components)
	end

    ##
    # Parameter: hashmap of components
    # filters null values and removes unnecessary keys
    # returns hashmap
    ##
	def self.decode_components(components)
		result = {}
		components.each do |key, value|
			value = value.to_s
			unless value.empty?
				result[key] = CGI.unescape(value) if not value.nil?
			end
		end
		result.delete("parser")
		result
	end

end
