class UsersController < ApplicationController
  def index
  end

  def show
  end

  def login
  end

  def signup
  end

  def edit
    p session[:user_id]
    @user = User.find(session[:user_id])
  end

  def create

    #user = User.new(user_params)
    #user.token = generate_token 64
    #if user.save
    #  redirect_to root_path
    #else
    #  redirect_to signup_path
    #end
    redirect_to signup_path
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to settings_path
    else
      redirect_to settings_path
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(
      :token,
      :address,
      :name,
      :image,
      :password,
      :password_confirmation,
      :password_digest
    )
  end
end
