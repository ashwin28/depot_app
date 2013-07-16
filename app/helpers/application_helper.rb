module ApplicationHelper
  def get_current_date
    Time.now.strftime('%a %d %b')
  end

  def get_current_time
    Time.now.strftime('%H:%M %p')
  end
end
