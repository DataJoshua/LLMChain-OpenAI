class InterfacesController < ApplicationController
  before_action :authenticate_user!
  before_action :skip_verify_authorized!

  def index
  end

  def create
    if create_token.success?
      flash[:notice] = "Token created successfully"
      puts create_token.access_token
    else
      flash[:alert] = "error"
    end

    redirect_to interfaces_path
  end

  private 

  def create_token
    @create_token ||= Users::CreateToken.call(user: current_user)
  end
end
