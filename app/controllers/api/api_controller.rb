module Api
  class ApiController < ActionController::API
    include JwtAuthentication
  end
end