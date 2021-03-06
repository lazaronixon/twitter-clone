module User::Relationshipable
  extend ActiveSupport::Concern

  included do
    has_many :following_relationships, class_name: "Relationship", foreign_key: "user_id",   dependent: :destroy
    has_many :followers_relationships, class_name: "Relationship", foreign_key: "target_id", dependent: :destroy

    has_many :following, through: :following_relationships, source: :target, counter_cache: :following_count
    has_many :followers, through: :followers_relationships, source: :user,   counter_cache: :followers_count

    delegate :size, prefix: true, to: :following
    delegate :size, prefix: true, to: :followers
  end

  def following?
    following.exists?(Current.user.id)
  end

  def followed?
    followers.exists?(Current.user.id)
  end

  def follow
    followers_relationships.create!(user: Current.user)
  end
end
