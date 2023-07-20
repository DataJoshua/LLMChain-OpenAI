module JwtAuthentication
  extend ActiveSupport::Concern

  class ApiUserUnAuthenticated < StandardError ; end

  included do
    rescue_from ApiUserUnAuthenticated, with: :deny_access!
  end

  def authenticate_key!
    return if current_user.present?

    raise ApiUserUnAuthenticated
  end

  def current_user
    return if access_token.blank?

    User.find_by(id: payload["sub"])
  end

  def access_token
    @access_token ||= request.headers["Authorization"]&.split&.last
  end

  def payload
    ::JWT.decode(access_token, jwt_secret, true, { algorithm: "HS256" }).first
  end

  def jwt_secret
    ENV.fetch("JWT_SECRET")
  end

  def deny_access!
    render json: { msg: "epired or incorrect api key!" }
  end
end
