class Relationship < ApplicationRecord
  belongs_to :user,   class_name: "User", foreign_key: "user_id"
  belongs_to :target, class_name: "User", foreign_key: "target_id"

  validates_uniqueness_of :user_id, scope: :target_id, message: "is already followed"
end
