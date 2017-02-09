# app/controllers/user_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
    # render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: {}, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :date_of_birth,
      :gender
    )
  end
end
