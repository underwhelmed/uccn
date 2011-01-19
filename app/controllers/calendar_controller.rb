class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month_for_members(@shown_month, user_signed_in?)
  end
  
  def day
    date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    @full_date = date.strftime("%A, %B %e, %Y")
    @events = Event.events_by_date(date, user_signed_in?)
  end
  
  def event
    @event = Event.find(params[:id])
    redirect_to calendar_path, :notice => 'You are not signed in and cannot view this event' if (!user_signed_in? && @event.members_only)  
  end
  
end
