class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #include Authentication
  #protect_from_forgery
  #rescue_from CanCan: :AccessDenied do |exception|
  #  flash[:error] = "Access denied."
  #  redirect_to root_url
  #end
  before_action :authenticate_user!

end
