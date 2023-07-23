module Chains
  class Create
    class Execute
      include Interactor

      delegate :user, :index_name,  to: :context
  
      def call
        context.fail!(error: "Chain not created") unless chain.save
      end
      
      private
  
      def chain
        Chain.new(index_name: "#{user.id}_#{index_name}", cluster_name: index_name , user: user)
      end
    end
  end
end
