class ChainsController < ApplicationController
  before_action :authenticate_user!
  before_action -> { authorize! Chain }, only: %i[index new create]
  before_action -> { @chain = current_user.chains.find(params[:chain_id])}, only: %i[train]
  before_action :set_chain, only: %i[edit update destroy show]
  before_action -> { authorize! @chain }, only: %i[show edit update destroy train]

  def show
  end

  def index
    @chains = current_user.chains
  end

  def new
    @chain = Chain.new
  end

  def create
    if create_chain.success?
      flash[:notice] = "chain created"
    else
      flash[:alert] = create_chain.error
    end

    redirect_to root_path
  end

  def train
    client = AiChain.new(index_name: @chain.index_name).client

    if client.add_data(paths: [train_params[:doc_url]])
      flash[:notice] = "The model has been trained"
    else
      flash[:alert] = "Something went wrong"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def train_params
    params.require(:train).permit(:doc_url, :doc)
  end

  def chain_params
    params.require(:chain).permit(:index_name, :description, :doc)
  end

  def set_chain
    @chain = current_user.chains.find(params[:id])
  end

  def create_chain
    @create_chain = Chains::Create.call(user: current_user, chain_params: chain_params)
  end
end
