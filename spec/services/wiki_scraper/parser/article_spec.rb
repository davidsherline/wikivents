require 'rails_helper'

RSpec.describe WikiScraper::Parser::Article do
  let(:html) { Nokogiri::HTML(File.new('spec/fixtures/files/article.html')) }
  let(:article_parser) { build(:article_parser, document: html) }

  describe '#title' do
    it 'should return the article title' do
      expect(article_parser.title).to eq('2017 Istanbul nightclub shooting')
    end
  end

  describe '#summary' do
    it 'should return the article summary' do
      expect(article_parser.summary).to include('A mass shooting occurred')
    end
  end

  describe '#image_url' do
    it 'should return the image url' do
      expect(article_parser.image_url).to include('.JPG')
    end
  end
end
