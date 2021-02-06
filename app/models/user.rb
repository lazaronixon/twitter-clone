class User < ApplicationRecord
  has_secure_password

  has_many :tweets, dependent: :destroy

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  validates :name,     presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email,    presence: true, uniqueness: { case_sensitive: false }
end
