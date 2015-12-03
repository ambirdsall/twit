class TweetsController < ApplicationController
  def index
    @tweets = user.tweets
    render json: @tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
    if @tweet.user != user
      head :bad_request
    else
      render json: @tweet
    end
  end

  def create
    new_tweet = Tweet.new(tweet_params)
    if new_tweet.save
      head :created
    else
      head :unprocessable_entity
    end
  end

  def destroy
    user.tweets.destroy(params[:id])

    head :ok
  end

  private

  def user
    User.find(params[:user_id])
  end

  def tweet_params
    params.permit(:user_id, :text)
  end
end
