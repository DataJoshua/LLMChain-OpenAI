module Users
  class CreateToken
    class Execute
      include Interactor

      delegate :user, to: :context

      def call
        context.fail!(error: "Token failed to create") unless access_token.present?

        context.access_token = access_token
      end

      private

      def access_token
        ::JWT.encode(payload, jwt_secret, "HS256")
      end

      def payload
        {
          "sub": user.id
        }
      end

      def jwt_secret
        ENV.fetch("JWT_SECRET")
      end
    end
  end
end
