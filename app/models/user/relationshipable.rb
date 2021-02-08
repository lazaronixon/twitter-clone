module User::Relationshipable
  extend ActiveSupport::Concern

  included do
    has_many :followers_relationships, class_name: "Relationship", foreign_key: "target_id", dependent: :destroy
    has_many :following_relationships, class_name: "Relationship", foreign_key: "user_id",   dependent: :destroy

    has_many :followers, through: :followers_relationships, source: :user
    has_many :following, through: :following_relationships, source: :target
  end

  def following?
    following.exists?(Current.user.id) || current?
  end

  def followed?
    followers.exists?(Current.user.id) || current?
  end

  def follow
    Current.user.following_relationships.create!(target: self)
  end

  private
    def current?
      self == Current.user
    end
end
