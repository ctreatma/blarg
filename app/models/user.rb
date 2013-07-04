require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password

  validates_presence_of :name, :password, :email

  before_save :encrypt_password

  private
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
