class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  private

  def user_params
    # binding.pry
    params.require(:user).permit(:name, :email, :password)
  end

end
