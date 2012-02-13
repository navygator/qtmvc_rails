module ApplicationHelper
  def title
    base_title = "Managing Study groups"
    "#{base_title} | #{@title}"
  end

  def logo
    image_tag("rails.png", :alt => "Logo", :class => "round")
  end
end
