module Chains
  class Create
    class Train
      include Interactor

      delegate :chain, to: :context

      def call 
        client = AiChain.new(index_name: chain.index_name).client
        
        doc_file = "app/files/prueba1.pdf"

        context.fail!(error: "not trainer") unless client.add_data(paths: [doc_file])
      end
    end
  end
end
