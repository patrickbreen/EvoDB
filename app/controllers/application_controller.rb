class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :devise_controller?
  before_action :devise_permitted_parameters, if: :devise_controller?


  protected

  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def admin_user
    flash[:alert] = "unauthorized"; redirect_to(root_url) unless current_user.admin?
  end

  def signed_in_user
    if !signed_in?
      redirect_to new_user_session_path, notice: "Please Sign In"
    end
  end

end
