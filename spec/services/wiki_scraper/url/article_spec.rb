require 'rails_helper'

RSpec.describe WikiScraper::URL::Article do
  describe '#url' do
    let(:path) { '/wiki/french' }
    let(:article_url) { build(:article_url, path: path) }
    let(:base_url) { article_url.class.const_get('BASE_URL') }

    it 'returns the URL' do
      expect(article_url.url).to eq("#{base_url}#{path}")
    end
  end
end
