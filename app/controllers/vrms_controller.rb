class VrmsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    user = User.find_by_id(session[:user_id])
    vrm = Vrm.new(vrm_params)
    vrm.user_id = user.id
    vrm.token = generate_token 64
    if vrm.save
      redirect_to vrms_path
    else
      redirect_to vrms_path
    end
  end

  def update

  end

  def destroy

  end

  private

  def vrm_params
    params.require(:vrm).permit(
      :user_id,
      :token,
      :name,
      :body
    )
  end
end
