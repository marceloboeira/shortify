class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found

  def index; end

  def not_found
    render :not_found, status: :not_found
  end
end
