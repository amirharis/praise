class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!


  layout :layout


  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      #if current_user.admin
      	#admin_domains_path
      #else
      	#usr_test_index_path
      #end
      demo_index_path
    else
      super
    end
     #if (request.referer == "/users/sign_in")
        #omains_path
        #root_path
     #else
        #request.referer
        #domains_path
      #end
  end

  def layout
    if is_a?(Devise::SessionsController) || is_a?(Devise::ConfirmationsController) ||  is_a?(Devise::PasswordsController) || is_a?(Devise::RegistrationsController)
      "login"
      #is_a?(RegistrationsController)
    #elsif is_a?(AuthenticationsController)
    #  "first_time"
    else
      "application"
    end
  end  

end
