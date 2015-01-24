class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_filter :meta_content

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:username, :email, :password, :password_confirmation, :type)
    }
  end

  def after_sign_in_path_for(resource)
  	if current_user.admin?
  		return backend_path
    else
      root_path
  	end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
    def meta_content
      @meta   = WebSetting.first
      @slider = WebSetting.first
    end
end
