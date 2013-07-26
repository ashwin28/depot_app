class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_i18n_locale_from_params
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

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end
end
