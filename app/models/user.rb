class User < ApplicationRecord
  has_secure_password
  
  has_many :items
  has_many :purchases , dependent: :destroy
  has_many :items_purchased,  through: :purchases, source: :item
 
  validates :first_name, :last_name, presence: true
  # validates :password, length: { minimum: 8 }
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
 
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
