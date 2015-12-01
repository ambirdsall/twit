class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def create
    user = User.new(user_params)

    user.save ? head(:created) : head(:unprocessable_entity)
  end

  protected

  def user_params
    # TODO name, email, password
  end
end
