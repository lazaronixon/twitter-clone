class Tweet < ApplicationRecord
  belongs_to :user

  scope :reverse_chronologically, -> { order created_at: :desc }

  validates :message, presence: true, length: { maximum: 280 }
end
