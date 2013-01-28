class Subscriber
  include Mongoid::Document
  field :name, :type => String
  field :email, :type => String
  field :confirmed, :type => Boolean
	field :key, type: String
	attr_accessible :name, :email
	before_create :generate_key

	def generate_key
		self.confirmed = false
		possible_characters = ('a'..'z').to_a + (0..9).to_a
		begin
			self.key = possible_characters.sample(30).join('')
		end while Subscriber.where( key: self.key ).count > 0
	end

end
