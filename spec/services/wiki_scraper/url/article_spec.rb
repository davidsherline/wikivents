require 'rails_helper'

RSpec.describe WikiScraper::URL::Article do
  describe '#url' do
    let(:url) { 'http://www.example.com/' }
    let(:article_url) { build(:article_url, url: url) }

    it 'returns the URL' do
      expect(article_url.url).to eq(url)
    end
  end
end
