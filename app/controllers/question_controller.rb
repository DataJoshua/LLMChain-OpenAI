class QuestionController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chain
  before_action :set_client
  before_action ->{@form ||= QuestionForm.new }

  def create
    @form.assign_attributes(question_params)

    if @form.valid?

      @res = @client.ask(question: question_params[:content])

      Message.transaction do
        Message.create(chain: @chain, text: question_params[:content], role: "user")
        Message.create(chain: @chain, text: @res, role: "agent")
      end
    else
      flash[:notice] = @form.errors.full_messages
    end

    redirect_to chain_path(@chain)
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
