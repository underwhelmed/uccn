module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end

  def pretty_date(date)
    date.strftime("%A, %B %e, %Y")
  end
  
  def request_from_pdfkit?
    # when generating a PDF, PDFKit::Middleware will set this flag
    request.env["Rack-Middleware-PDFKit"] == "true"
  end
 
end
