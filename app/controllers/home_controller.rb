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
    r = {
      success: false,
      userToken: "",
      userName: "",
      userVrms: []
    }
    if params[:secret] == Rails.application.credentials[:webverse][:api_secret]
      user = User.find_by_address(params[:address])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        vrms = []
        user.vrms.each do |vrm|
          vrms.append({
                        token: vrm.token,
                        name: vrm.name
                      })
        end
        r = {
          success: true,
          userToken: user.token,
          userName: user.name,
          userVrms: vrms
        }
      end
    end

    render json: r
  end

  def external_fetch_session
    r = {
      success: false,
      userToken: "",
      userName: "",
      userVrms: []
    }
    if params[:secret] == Rails.application.credentials[:webverse][:api_secret]
      user = User.find_by_id(session[:user_id])
      if user
        r[:success] = true
      end
    end
    render json: r
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
