class Book
  include Mongoid::Document
  field :title, type: String
	embeds_many :pages, cascade_callbacks: true
	accepts_nested_attributes_for :pages
end
