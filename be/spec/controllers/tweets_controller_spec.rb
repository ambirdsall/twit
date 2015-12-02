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
end
