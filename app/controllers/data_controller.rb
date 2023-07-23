class DataController < ApplicationController
  before_action :set_chain, only: %i[create ask]

  def index
  end

  def create
    @chain.add_texts(
      texts: [data_params[:content]]
    )
    
    redirect_to root_path
  end

  def ask
    @res = @chain.ask(question: ask_params[:content])
  end


  def data_params
    params.require(:data).permit(:content)
  end

  def ask_params
    params.require(:question).permit(:content)
  end

  private

  def set_chain
    @chain = AiChain.new(index_name: "sample").client
  end
end
