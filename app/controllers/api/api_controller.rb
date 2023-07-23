module Api
  class ApiController < ActionController::API
    include ActionPolicy::Controller
    include JwtAuthentication
    include ApiAuthorization

    authorize :user, through: :current_user
  end
end
