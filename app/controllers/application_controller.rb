class ApplicationController < ActionController::Base
  helper_method :current_user
  allow_browser versions: :modern
  before_action :debug_session


  # Disable CSRF checks (needed for React frontend making API calls)
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def debug_session
    Rails.logger.info "Session user_id: #{session[:user_id]}"
    Rails.logger.info "Signed cookie user_id: #{cookies.signed[:user_id]}"
  end
end
