class ApplicationController < ActionController::Base
  protect_from_forgery
 
  unless  ActionController::Base.consider_all_requests_local
    rescue_from Exception, :with => :render_404
  end

  private

    def render_404
      render(:file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404)
    end
   
end
