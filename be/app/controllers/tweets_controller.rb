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

  private

  def user
    User.find(params[:user_id])
  end
end
