require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET users' do
    it "returns a JSON object containing all users" do
      100.times { FactoryGirl.create :user }
      all_users = User.all
      get :index

      expect(response.content_type).to eq 'application/json'
      expect(response.body).to eq all_users.to_json
      expect(JSON.parse(response.body).length).to eq 100
    end
  end

end
