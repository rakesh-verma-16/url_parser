module ParserHelper

	INVALID_URL = 'Invalid URL. Please try again with a valid URL.'
	
	# Doesn't work on all kinds of URLs.
	def self.valid_url?(url)
		url_regexp = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i
		url =~ url_regexp ? true : false
	end

	def self.parse_url(url)
		uri = URI.parse(url)
		components = uri.instance_values
		if (!UrlHistory.insert(components))
			flash[:notice] = 'Unable to save to db'
		end
		return components
	end
end
