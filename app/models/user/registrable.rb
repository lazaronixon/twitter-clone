module User::Registrable
  extend ActiveSupport::Concern

  included do
    has_secure_password

    scope :alphabetically, -> { order :name }    

    validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

    validates :name,     presence: true
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email,    presence: true, uniqueness: { case_sensitive: false }
  end
end
