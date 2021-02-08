class Relationship < ApplicationRecord
  belongs_to :user,   class_name: "User", foreign_key: "user_id",   counter_cache: :following_count
  belongs_to :target, class_name: "User", foreign_key: "target_id", counter_cache: :followers_count

  validates_uniqueness_of :user_id, scope: :target_id, message: "is already followed"
  validate :cannot_follow_yourself

  def cannot_follow_yourself
    errors.add(:base, "You cannot follow yourself") if user == target
  end
end
