class HomeController < ApplicationController
  def top
    @app = Unity202202App.find(1)
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
