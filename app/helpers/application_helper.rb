module ApplicationHelper
  def get_current_date
    Time.now.strftime('%a %d %b')
  end

  def get_current_time
    Time.now.strftime('%H:%M %p')
  end

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
