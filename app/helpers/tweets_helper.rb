module TweetsHelper
  def tweet_header(tweet)
    sanitize "<strong>#{tweet.name}</strong>, #{at tweet.user} - #{l tweet.created_at, format: :long}"
  end
end
