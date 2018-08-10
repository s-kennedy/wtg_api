class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def update
    @user = User.find session[:user_id]
    @user.update_attributes user_params

      if @user.save
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :bad_request
      end
  end


  def destroy
    @user = User.find_by session[:id]
    @user.destroy!

    render status: :no_content
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
