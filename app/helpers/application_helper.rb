module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end

  def post_url(post)
    return "#{root_url}/#{post.url}"
  end

  def pretty_date(date)
    date.strftime("%A, %B %d, %Y")
  end
    
end
