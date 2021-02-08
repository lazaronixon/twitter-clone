module User::Feedable
  extend ActiveSupport::Concern

  included do
    has_many :tweets, dependent: :destroy

    delegate :size, prefix: true, to: :tweets
  end

  def feed
    Tweet.where(user: self).or(following_tweets)
  end

  private
    def following_tweets
      Tweet.where(user: following)
    end
end
