class Feed
  include Mongoid::Document
  field :name, :type => String
  field :url, :type => String

	def feedzirra
		Feedzirra::Feed.fetch_and_parse(url)
	end
end
