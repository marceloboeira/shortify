class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  def index; end

  def not_found
    redirect_to root_path, status: :not_found
  end
end
