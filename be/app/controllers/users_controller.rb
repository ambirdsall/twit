class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    user.save ? head(:created) : head(:unprocessable_entity)
  end

  protected

  def user_params

  end
end
