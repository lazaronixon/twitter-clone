class User < ApplicationRecord
  has_secure_password

  has_many :tweets, dependent: :destroy

  has_many :followers_relationships, class_name: "Relationship", foreign_key: "target_id", dependent: :destroy
  has_many :following_relationships, class_name: "Relationship", foreign_key: "user_id",   dependent: :destroy

  has_many :followers, through: :followers_relationships, source: :user
  has_many :following, through: :following_relationships, source: :target

  scope :alphabetically, -> { order :name }

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  validates :name,     presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email,    presence: true, uniqueness: { case_sensitive: false }

  def following?
    following.exists?(Current.user.id) || current?
  end

  def followed?
    followers.exists?(Current.user.id) || current?
  end

  def current?
    self == Current.user
  end

  def follow
    Current.user.following_relationships.create!(target: self)
  end

  def feed
    Tweet.where(user: self).or(following_tweets)
  end

  private
    def following_tweets
      Tweet.where(user: following)
    end
end
