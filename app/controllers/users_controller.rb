class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've been successfully signed up."
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing you up. Please try again."
      redirect_to :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
