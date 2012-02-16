PDFKit.configure do |config|
  config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if ['production', 'staging'].include? ::Rails.env
  config.default_options = {
    :page_size => 'Letter',
    :print_media_type => true
  }
end