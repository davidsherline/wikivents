class CreateEventsJob < ApplicationJob
  queue_as :default

  def perform(date)
    create_event(date)
    true
  end

  private

  def create_event(date)
    return false if date_invalid?(date)
    WikiScraper::EventsCreator.new(date).create
  end

  def date_invalid?(date)
    Day.exists?(date: date) || date.to_date >= Date.current
  end
end
