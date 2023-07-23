module Api
  module V1
    class TeachController < ApiController
      before_action :authenticate_key!
      before_action :set_chain
      before_action -> { authorize! @chain, with: TeachPolicy } 
      before_action :set_client
      before_action ->{ @form ||= TeachForm.new }

    
      def create
        @form.assign_attributes(teach_params)
    
        if @form.valid?
          @res = @client.add_texts(texts: [teach_params[:content]])
          
          render json: { errors: [], state: @res }
        else
          render json: {errors: @form.errors.full_messages, status: "unproccesable_entity"}
        end
      end
    
      private
    
      def teach_params
        params.require(:teach).permit(:content)
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