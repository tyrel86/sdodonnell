class Subscriber
  include Mongoid::Document
  field :name, :type => String
  field :email, :type => String
  field :confirmed, :type => Boolean
	attr_accessible :name, :email
end
