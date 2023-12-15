
class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.first
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation])
  end
end
