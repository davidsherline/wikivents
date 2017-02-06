require 'rails_helper'

RSpec.describe WikiScraper::Parser::SummaryDay do
  let(:summary_parser) { build(:summary_parser) }
  let(:summary_day_parser) { summary_parser.days.first }

  describe '#date' do
    it 'should return the date object' do
      expect(summary_day_parser.date).to eq(Date.new(2017, 1, 1))
    end
  end

  describe '#links' do
    it 'should return an array of links for that day' do
      expect(summary_day_parser.links.count).to eq(15)
    end
  end
end
