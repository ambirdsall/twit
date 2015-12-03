class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find params[:id]

    render json: @user
  end

  def create
    user = User.new(user_params)

    user.save ? head(:created) : head(:unprocessable_entity)
  end

  def destroy
    User.find(params[:id]).destroy

    head :ok
  end

  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
