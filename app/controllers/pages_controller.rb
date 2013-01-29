class PagesController < ApplicationController
  def home
  end
	def news_events
		@events = Event.all
		rss_feeds = Feed.all
		@feeds = rss_feeds.inject([]) do |r,rss_feed|
			feed = rss_feed.feedzirra
			((feed.class == Feedzirra::Parser::RSS) ? r << feed : r)
		end
	end 

	def contact
		@contact = Contact.new
	end

end
