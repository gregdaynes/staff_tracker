class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)

    render json: @user

    # if @user.save
    #   redirect_to @users
    # end
  end

  private
    def user_params
      params.require(:user).permit(:first_name)
    end

end
