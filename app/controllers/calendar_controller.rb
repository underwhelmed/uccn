class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month_for_members(@shown_month, user_signed_in?)
  end
  
  def day
    @full_date = "January 11, 2011"
    @events = Event.all
  end
  
  def event
    @event = Event.find(params[:id])
    redirect_to calendar_path, :notice => 'You are not signed in and cannot view this event' if (!user_signed_in? && @event.members_only)  
  end
  
end
