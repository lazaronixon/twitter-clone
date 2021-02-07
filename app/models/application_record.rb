class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :reverse_chronologically, -> { order created_at: :desc }
end
