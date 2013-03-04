class Event
  include Mongoid::Document
	include Mongoid::Timestamps
  field :date, :type => Date
  field :heading, :type => String

end
