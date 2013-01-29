class Page
  include Mongoid::Document
  field :content, type: String
  field :page_number, type: Integer
	embedded_in :book
end
