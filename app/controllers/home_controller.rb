class HomeController < ApplicationController
  require "base64"

  protect_from_forgery except: [:external_new_session, :external_fetch_session]

  def top

  end

  def new_session
    user = User.find_by_address(params[:address])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to settings_path
    else
      redirect_to login_path
    end
  end

  def uploadapp
    @app = Unity202202App.find(1)
  end

  def create_app
    app = Unity202202App.new(app_params)
    app.save
    redirect_to uploadapp_path
  end

  def update_app
    app = Unity202202App.find(1)
    app.update(app_params)
    app.save
    redirect_to uploadapp_path
  end

  def external_new_session
    if params[:secret] == Rails.application.credentials[:webverse][:api_secret]
      user = User.find_by(address: params[:address])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {
          name: user.name
        }
      else
        render json: false
      end

    else
      render json: false
    end
  end

  def external_fetch_session
    if params[:secret] == Rails.application.credentials[:webverse][:api_secret]
      user = User.find_by_id(session[:user_id])
      if user
        render json: {
          success: true,
          token: user.token,
          name: user.name,
          image: user.image.url,
        }
      else
        render json: false
      end
    else
      render json: false
    end
  end

  private

  def app_params
    params.require(:unity202202_app).permit(
      :loader_file,
      :data_file,
      :framework_file,
      :code_file
    )
  end
end
