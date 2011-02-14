module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end

  def pretty_date(date)
    date.strftime("%A, %B %e, %Y")
  end
  
 
end
