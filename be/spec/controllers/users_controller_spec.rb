require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET users' do
    it "returns a JSON object containing all users" do
      all_users = User.all
      get :index

      expect(response.content_type).to eq 'application/json'
      # Create mock users
      expect(response.body).to eq all_users.to_json
    end
  end

end
