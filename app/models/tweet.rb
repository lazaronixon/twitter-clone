class Tweet < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :message, presence: true, length: { maximum: 280 }
end
