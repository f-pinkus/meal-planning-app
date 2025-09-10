class ApplicationController < ActionController::Base
  helper_method :current_user
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token
  self.forgery_protection_origin_check = false
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end
