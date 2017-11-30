module ApplicationHelper
  def link_button(title, color, url)
    link_to(raw("<button class=\"btn #{color}\">#{title}</button>"), url)
  end
end
