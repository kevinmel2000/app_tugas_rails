class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters

	def create
    super do
      resource.type = 'Member'
      resource.save
    end
  end

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u|
	      u.permit(
	      					:username, 
	      					:email, 
	      					:password, 
	      					:password_confirmation,
	      					:type
	      				)
	    }
	    devise_parameter_sanitizer.for(:sign_in) { |u| 
	    	u.permit(:username, :email, :password, :remember_me) 
	    }
	  end

end