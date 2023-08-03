module Chains
  class Create
    class Execute
      include Interactor

      delegate :user, :chain_params,  to: :context
  
      def call
        context.fail!(error: chain.errors) unless chain.save

        context.chain = chain
      end
      
      private
  
      def params
        chain_params.merge({
          index_name: "#{user.id}_#{chain_params[:index_name]}", cluster_name: chain_params[:index_name] , user: user
        })
      end

      def chain
        chain_obj ||= Chain.new(params)
      end
    end
  end
end
