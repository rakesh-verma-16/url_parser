module ParserHelper

	INVALID_URL = 'Invalid URL. Please try again with a valid URL.'
	
	# Doesn't work on all kinds of URLs.
	def self.valid_url?(url)
		url_regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  		url =~ url_regexp ? true : false
	end

	def self.parse_url(url)
		uri = URI.parse(url)
		components = uri.instance_values
		if (!UrlHistory.insert(components))
			p "Abhay maa chudi padi hai"
		end
		return components
	end
end
