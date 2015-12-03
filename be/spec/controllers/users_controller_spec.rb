require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    100.times { FactoryGirl.create :user }
    @users = User.all
  end

  context 'GET users' do
    it "returns a JSON array containing all users" do
      get :index

      expect(response.content_type).to eq 'application/json'
      expect(response.body).to eq @users.to_json
      expect(JSON.parse(response.body).length).to eq 100
    end
  end

  context 'GET user' do
    it "returns a JSON object with the requested user" do
      first_user = @users.first
      get :show, id: first_user

      expect(response.body).to eq first_user.to_json
    end
  end

  context 'POST users' do
    context 'valid params' do
      before(:each) do
        post :create, email: 'unique@example.com', name: 'Joe Blow', password: '123'
      end

      it 'creates a new user' do
        expect(User.count).to be 101
      end
      it 'returns an http status of created' do
        expect(response).to have_http_status 201
      end
    end
    context 'invalid params' do
      context 'validations' do
        it "doesn't create User with non-unique email"
      end
    end
  end

  context 'DELETE user' do
    it "deletes a user" do
      expect(User.count).to be 100

      delete :destroy, id: User.last.id

      expect(User.count).to be 99
      expect(response).to have_http_status 200
    end
  end
end
