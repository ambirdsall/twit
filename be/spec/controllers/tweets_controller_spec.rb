require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  before :each do
    @user = FactoryGirl.create :user
    100.times { FactoryGirl.create(:tweet, user: @user) }
  end

  context "GET user_tweets" do
    it "gets all of the user's tweets" do
      get :index, user_id: @user.id

      expect(response.body).to eq @user.tweets.to_json
      expect(JSON.parse(response.body).length).to eq 100
    end

    it "doesn't get tweets from other users" do
      other_user = FactoryGirl.create :user
      100.times { FactoryGirl.create(:tweet, user: other_user) }
      get :index, user_id: @user.id

      expect(response.body).to eq @user.tweets.to_json
      expect(response.body).not_to eq other_user.tweets.to_json
    end
  end

  context "GET user_tweet" do
    it "gets a single tweet as JSON" do
      first_tweet = @user.tweets.first
      get :show, user_id: @user.id, id: first_tweet.id

      expect(response.body).to eq first_tweet.to_json
    end

    it "returns a bad_request status if the user_id is wrong" do
      first_tweet = @user.tweets.first
      other_user  = FactoryGirl.create(:user)
      get :show, user_id: other_user.id, id: first_tweet.id

      expect(response).to have_http_status(400)
    end
  end
end
