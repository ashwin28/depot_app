class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action :check_user_count, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Logged out"
  end

  private
    def check_user_count
      if User.count.zero?
        redirect_to new_user_url, notice: "Please create a user first!"
      end
    end
end
