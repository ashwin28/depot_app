class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def authorize
      unless User.find_by_id(session[:user_id]) or User.count.zero?
        redirect_to login_url, alert: "Please log in"  
      end

      if User.count.zero?
        if request.path_parameters[:controller] == "users" 
          # allow user to create the first user
        else
          redirect_to new_user_url, notice: "Please create a user and log in"
        end 
      end
    end
end
