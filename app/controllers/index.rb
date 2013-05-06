get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = User.find_or_create_by_username(params[:username])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.order("created_at DESC").limit(10)
  erb :tweets
end
