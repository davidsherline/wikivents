require 'rails_helper'

RSpec.describe WikiScraper::PageImporter do
  describe '#page', :vcr do
    let(:page_importer) { build(:page_importer) }

    before(:each) do
      stub_request(:any, /en.wikipedia.org/)
        .to_return(body: File.new('spec/fixtures/files/article.html'),
                   status: 200)
    end

    it 'should return a Nokogiri-parsed HTML document' do
      expect(page_importer.page).to be_a Nokogiri::HTML::Document
    end
  end
end
