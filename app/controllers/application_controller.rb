class ApplicationController < ActionController::Base

  protected

  def generate_token(length)
    r = ""
    (0..length).each do
      r += rand(36).to_s(36)
    end
    r
  end
end
