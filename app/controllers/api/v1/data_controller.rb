module Api
  module V1
    class DataController < ApiController
      before_action :set_chain

      def ask
        @res = @chain.ask(question: params[:content])

        render json: { answer: @res }
      end

      def create
        @res = @chain.add_texts(
          texts: [params[:content]] 
        )

        render json: @res
      end

      private

      def set_chain
        @chain = AiChain.new(index_name: "sample").client
      end
    end
  end
end
