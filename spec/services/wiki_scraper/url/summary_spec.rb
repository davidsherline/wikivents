require 'rails_helper'

RSpec.describe WikiScraper::URL::Summary do
  describe '#url' do
    let(:summary_url) { build(:summary_url, date: '2017-01-01') }
    let(:base_url) { summary_url.class.const_get('BASE_URL') }

    it 'returns a Wiki summary page URL' do
      expect(summary_url.url).to eq("#{base_url}January_2017")
    end
  end
end
