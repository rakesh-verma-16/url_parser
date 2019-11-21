module RegexHelper

	##
	# parameter: url string
	# Matches a url to it's mapped regex scheme
	# returns regex expression
	##
	def self.match_url_regex(url)
		scheme = url.split(':').first
		case scheme
		when "mailto"
			return self.mailto_regex
		when "tel"
			return self.tel_regex
		else
			return self.default_regex
		end
	end

	private
	

	# Regex for tel links
	def self.tel_regex
		url_regexp = /(?:\b|\+)(?:tel:)?(((\+[0-9]{1,2}|00[0-9]{1,2})[-\ .]?)?)(\d[-\ .]?){5,15}/ix
	end

	# Regex for ftp|http|https links
	def self.default_regex
		url_regexp = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/ix
	end

	# Regex for mailto links
	def self.mailto_regex
		url_regexp = /(?:\b|\+)(?:mailto:)?([\w\.+#-]+)@([\w\.-]+\.\w{2,4})\b/ix
	end
end
