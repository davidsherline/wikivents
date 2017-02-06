class CreateEventsJob < ApplicationJob
  queue_as :default

  def perform(date)
    return false if date_invalid?(date)
    WikiScraper::EventsCreator.new(date).create
    true
  end

  private

  def date_invalid?(date)
    Day.exists?(date: date) || date >= Date.current
  end
end
