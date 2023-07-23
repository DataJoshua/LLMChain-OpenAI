class ApplicationController < ActionController::Base
  include Authorization

  before_action :skip_verify_authorized!, if: :devise_controller?
end
