class Tweet < ApplicationRecord
  belongs_to :user, counter_cache: true

  delegate :name, :username, to: :user

  validates :message, presence: true, length: { maximum: 280 }
end
