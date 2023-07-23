module Api
  module V1
    class QuestionController < ApiController
      before_action :authenticate_key!
      before_action :set_chain
      before_action -> { authorize! @chain, with: QuestionPolicy } 
      before_action :set_client
      before_action -> { @form ||= QuestionForm.new }
    
      def create
        @form.assign_attributes(question_params)
    
        if @form.valid?
          @res = @client.ask(question: question_params[:content])

          render json: { errors: [], status: "ok", response: { text: @res} }
        else
          render json: { errors: @form.errors.full_messages, status: "error" }
        end
      end
    
      private
    
      def question_params
        params.require(:question).permit(:content)
      end
    
      def set_chain
        @chain ||= Chain.find_by(id: params[:chain_id])
      end
    
      def set_client
        @client ||= AiChain.new(index_name: @chain.index_name).client
      end
    end
  end
end