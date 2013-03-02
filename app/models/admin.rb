class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password

  field :user_name, type: String
  field :password_hash, type: String
  field :password_salt, type: String
	field :oauth_token

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end 
  end 

  class << self
    def authenticate(user_name, password)
      admin = where(user_name: user_name).first
      if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
        admin
      else
        nil 
      end 
    end 
  end 

end
