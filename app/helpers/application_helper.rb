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
  
  def pdf_image_tag(filename, options = {})
    path = Rails.root.join("../public/images/#{filename}")
    options[:src] = path.to_s
    attributes = options.map{ |k,v| "#{k}='#{v}'" }.join(" ")
    raw("<img #{attributes}/>")
  end
 
end
