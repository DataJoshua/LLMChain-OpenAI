module Chains
  class Create
    class Execute
      include Interactor

      delegate :user, :chain_params,  to: :context
  
      def call
        context.fail!(error: chain.errors) unless chain.save
      end
      
      private
  
      def chain
        chain_obj ||= Chain.new(index_name: "#{user.id}_#{chain_params[:index_name]}", cluster_name: chain_params[:index_name] , user: user, description: chain_params[:description])
      end
    end
  end
end
