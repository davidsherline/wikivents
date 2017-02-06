require 'rails_helper'

RSpec.describe WikiScraper::Parser::Summary do
  let(:html) { Nokogiri::HTML(File.new('spec/fixtures/files/summary.html')) }
  let(:summary_parser) { build(:summary_parser, document: html) }

  describe '#days' do
    it 'should return an array of WikiScraper::Parser::SummaryDay objects' do
      expect(summary_parser.days.first).to be_a WikiScraper::Parser::SummaryDay
    end

    it 'should have as many elements as days in the summary' do
      expect(summary_parser.days.count).to eq(31)
    end
  end
end
