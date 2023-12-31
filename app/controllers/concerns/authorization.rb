module Authorization 
  extend ActiveSupport::Concern

  included do
    verify_authorized

    rescue_from ActionPolicy::Unauthorized, with: :deny_user_access!
  end
  
  def deny_user_access!
    flash[:alert] = "You are not authorized!"
    
    redirect_to root_path
  end
end
