class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month_for_members(@shown_month, user_signed_in?)
  end
  
  def event
    @event = Event.find(params[:id])
  
  end
  
end
