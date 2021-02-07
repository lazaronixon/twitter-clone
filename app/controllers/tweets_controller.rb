class TweetsController < ApplicationController
  def index
    set_page_and_extract_portion_from Current.user.feed.reverse_chronologically, per_page: 10
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.build(tweet_params)
    @tweet.save!

    redirect_to tweets_path, notice: "Tweet was successfully created."
  end

  private
    def tweet_params
      params.require(:tweet).permit(:message)
    end
end
