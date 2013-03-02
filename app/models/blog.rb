class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
	include Mongoid::Paperclip

  field :title, type: String
  field :content, type: String
	has_mongoid_attached_file :main_blog_image

	def exerpt( words )
		HTML_Truncator.truncate(content, words)
	end

end
