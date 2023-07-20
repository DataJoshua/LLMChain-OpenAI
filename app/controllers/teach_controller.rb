class TeachController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chain
  before_action :set_client
  before_action ->{ @form ||= TeachForm.new }

  def create
    @form.assign_attributes(teach_params)

    if @form.valid?
      @res = @client.add_texts(texts: [teach_params[:content]])

      flash[:notice] = @res
    else
      flash[:alert] = @form.errors.full_messages
    end

    redirect_to chain_path(@chain)
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
