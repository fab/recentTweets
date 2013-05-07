# get '/' do
#   # Look in app/views/index.erb
#   erb :index
# end

get '/' do

  erb :index
end

post '/' do
  @user = User.find_or_create_by_username(params[:username])

  if @user.tweets_stale?
    puts "API call"
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.order("tweeted_at DESC").limit(10)
  erb :_tweets, :layout => false
end
