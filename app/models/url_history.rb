class UrlHistory < ApplicationRecord

	UNABLE_TO_SAVE = "Unable to save to database."
	
	def self.insert(uri_components)
		url_history = self.create_object(uri_components)
		if (url_history.save)
			return true
		end
		return false
	end

	private 

	def self.create_object(uri_components)
		url_history = UrlHistory.new(
			:scheme => uri_components["scheme"],
			:user => uri_components["user"],
			:password => uri_components["password"],
			:host => uri_components["host"],
			:port => uri_components["port"],
			:path => uri_components["path"],
			:query => uri_components["query"],
			:opaque => uri_components["opaque"],
			:fragment => uri_components["fragment"]
			)
	end

end
