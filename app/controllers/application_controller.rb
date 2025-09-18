class ApplicationController < ActionController::Base
  helper_method :current_user
  allow_browser versions: :modern

  # Disable CSRF checks (needed for React frontend making API calls)
  skip_before_action :verify_authenticity_token

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end
