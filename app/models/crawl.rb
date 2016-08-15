class	Crawl
	def self.crawl
		require 'koala'
		@graph = Koala::Facebook::API.new("EAACEdEose0cBALEF8cyZB5OHrzvbvlI4ccqBO3BlTaYwYcZA18nUxcL8WPCbXIYuqlhCH6T6NgWDFJlau1mEZAmZA3qVQSrmQK2CYDHIDnvKBcaOP8f14BkCA1DMeCMpT97aLLsKWE7uH7qMZBctFrFdR78OUzEKbrTeMgkE8OAZDZD")
		@graph.get_connection("15704546335","posts").each do |page|
			page.each do |post|
				content = post["message"]
				created_at = post["created_time"]
				facebook_number = post["id"]
			end
		end
	end
end
