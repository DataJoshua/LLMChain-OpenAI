module ApiAuthorization 
  extend ActiveSupport::Concern

  included do
    verify_authorized

    rescue_from ActionPolicy::Unauthorized, with: :deny_user_access!
  end
  
  def deny_user_access!
    render json: { msg: "You are unauthorized to do this request!" }
  end
end
