require 'rails_helper'

RSpec.describe CreateEventsJob, type: :job do
  describe '#process' do
    context 'with a date already in the database' do
      let(:day) { create(:day, :today) }
      let(:date) { day.date.to_s }

      before(:each) do
        CreateEventsJob.perform_now(date)
      end

      it 'should not run the process' do
        expect_any_instance_of(WikiScraper::EventsCreator)
          .to_not receive(:create)
      end
    end

    context 'with a date in the future' do
      let(:date) { Date.current + 7.days }

      before(:each) do
        CreateEventsJob.perform_now(date)
      end

      it 'should not run the process' do
        expect_any_instance_of(WikiScraper::EventsCreator)
          .to_not receive(:create)
      end
    end

    context 'with a valid date' do
      let(:date) { Date.current - 7.days }

      before(:each) do
        expect_any_instance_of(WikiScraper::EventsCreator).to receive(:create)
      end

      it 'should run the process' do
        expect(CreateEventsJob.perform_now(date)).to be(true)
      end
    end
  end
end
