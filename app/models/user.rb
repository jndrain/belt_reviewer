class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments
  has_many :joins, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 8}
end
