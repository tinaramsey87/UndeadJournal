class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :comments
  has_many :posts

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
