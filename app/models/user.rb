class User < ApplicationRecord
  has_secure_password
  has_many :connections, :foreign_key => 'user_id', :class_name => 'Connection'
  has_many :connectees, through: :connections
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :description, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  before_save :email_downcase

  def email_downcase
    self.email.downcase
  end
end
