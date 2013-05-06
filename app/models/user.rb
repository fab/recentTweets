class User < ActiveRecord::Base
  has_many :tweets


  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)
    tweets.each do |tweet|
      Tweet.find_or_create_by_text_and_user_id(:text => tweet.text, :user_id => self.id)
    end
  end

  def tweets_stale?
    return true if self.tweets.empty?
    (Time.now - self.tweets.last.created_at) > 60
  end
end
