class User < ApplicationRecord
  has_secure_password
  has_many :transactions

  validates_presence_of :password, :email
end
