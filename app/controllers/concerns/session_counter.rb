module SessionCounter
  extend ActiveSupport::Concern

  private

    def set_count
      session[:counter] ||= 0
      session[:counter] += 1
    end

    def reset_count
      session[:counter] = 0
    end
end