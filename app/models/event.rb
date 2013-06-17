class Event
  include Mongoid::Document
	include Mongoid::Timestamps
  field :date, :type => Date
  field :heading, :type => String
	before_save :update_line_breaks

	def update_line_breaks
		self.heading.gsub!("\n","<br />")
	end
end
