class DataController < ApplicationController
  def index
  end

  def create
    CLIENT.add_texts(
      texts: [data_params[:content]]
    )
    
    redirect_to root_path
  end

  def ask
    @res = CLIENT.ask(question: ask_params[:content])
  end


  def data_params
    params.require(:data).permit(:content)
  end

  def ask_params
    params.require(:question).permit(:content)
  end
end
