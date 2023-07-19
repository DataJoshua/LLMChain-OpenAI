module Api
  module V1
    class DataController < ApiController
      def ask
        @res = CLIENT.ask(question: params[:content])

        render json: { answer: @res }
      end

      def create
        @res = CLIENT.add_texts(
          texts: [params[:content]] 
        )

        render json: { msg: @res }
      end
    end
  end
end
