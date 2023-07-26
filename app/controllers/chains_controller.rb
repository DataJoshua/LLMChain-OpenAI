class ChainsController < ApplicationController
  before_action :authenticate_user!
  before_action -> { authorize! Chain }, only: %i[index new create]
  before_action :set_chain, only: %i[edit update destroy show]
  before_action -> { authorize! @chain }, only: %i[show edit update destroy]

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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def chain_params
    params.require(:chain).permit(:index_name, :description)
  end

  def set_chain
    @chain = current_user.chains.find(params[:id])
  end

  def create_chain
    @create_chain = Chains::Create.call(user: current_user, chain_params: chain_params)
  end
end
