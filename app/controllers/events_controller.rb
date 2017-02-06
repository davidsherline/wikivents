class EventsController < ApplicationController
  before_action :create_events, only: :index

  def index
    @day = Day.find_by(date: date.to_s)
    @events = Event.find_by(day: @day)
  end

  private

  def create_events
    CreateEventsJob.perform_now(date.to_s)
    CreateEventsJob.perform_later(day_before.to_s)
    CreateEventsJob.perform_later(day_after.to_s)
  end

  def date
    params.fetch(:date, Date.current - 1.day).to_date
  end

  def day_before
    date - 1.day
  end

  def day_after
    date + 1.day
  end
end
