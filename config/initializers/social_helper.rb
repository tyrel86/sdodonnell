module SocialHelper

	def self.post( params, blog )
		self.post_facebook( blog ) if params[:facebook]
		self.post_twitter( blog ) if params[:twitter]
	end

	def self.post_facebook( blog )
		@graph = Koala::Facebook::API.new("AAACCEWVRC7EBADQjwLZCvxO6S1ZBkWVepGLm6IPgiEYwQII0jfDTTtlU3tcSeRAdvkbmrZBXXvmiLkkZB8oBcxGy2FnUVLayKCN7u2W9ENJLpP82Om7k")
		message = "#{blog.title}\n\n#{Sanitize.clean(blog.exerpt(100)).strip}\n\nView The Full Post At\nhttp://sdodonnell.com/blogs/#{blog.id}"
		@graph.put_object("251731921625102", "feed", :message => message, picture: "http://sdodonnell.com#{blog.main_blog_image(:original)}")
	end
	
	def self.post_twitter( blog )
		Twitter.configure do |config|
			config.consumer_key = "vgOlF7HxohwUePVeeKrPvQ"
			config.consumer_secret = "30d3VPAa2TK9a5SDxElQ6p9Y3eDVSVfDdprarsoU3E"
			config.oauth_token = "1210093722-TFkykEI0K4eUjz2JiKtDBYAasnBhNwqTyFP0hxQ"
			config.oauth_token_secret = "V45er6WlzH89PoXLKtdoUTDdPXOOx7MHDpmHAuls"
		end
		Twitter.update("Hey everyone I just made a new blog post check it out at http://sdodonnell.com/blogs/#{blog.id}")
	end

	def self.post_event( event )
		@graph = Koala::Facebook::API.new("AAACCEWVRC7EBADQjwLZCvxO6S1ZBkWVepGLm6IPgiEYwQII0jfDTTtlU3tcSeRAdvkbmrZBXXvmiLkkZB8oBcxGy2FnUVLayKCN7u2W9ENJLpP82Om7k")
		message = "We are #{event.heading} on #{event.date}"
		@graph.put_object("251731921625102", "feed", :message => message)

		Twitter.configure do |config|
			config.consumer_key = "vgOlF7HxohwUePVeeKrPvQ"
			config.consumer_secret = "30d3VPAa2TK9a5SDxElQ6p9Y3eDVSVfDdprarsoU3E"
			config.oauth_token = "1210093722-TFkykEI0K4eUjz2JiKtDBYAasnBhNwqTyFP0hxQ"
			config.oauth_token_secret = "V45er6WlzH89PoXLKtdoUTDdPXOOx7MHDpmHAuls"
		end
		Twitter.update(message)
	end

end
