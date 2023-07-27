module Chains
  class Create
    class Execute
      include Interactor

      delegate :user, :chain_params,  to: :context
  
      def call
        context.fail!(error: "Chain not created") unless chain.save
      end
      
      private
  
      def chain
        Chain.new(chain_params.merge({index_name: "#{user.id}_#{chain_params[:index_name]}", cluster_name: chain_params[:index_name] , user: user}))
      end
    end
  end
end
