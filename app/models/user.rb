class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :username, presence: true, uniqueness: true
end
