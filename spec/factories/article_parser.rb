FactoryGirl.define do
  factory :article_parser, class: WikiScraper::Parser::Article do
    skip_create

    transient do
      document { Nokogiri::HTML(File.new('spec/fixtures/files/article.html')) }
    end

    initialize_with { new(document) }
  end
end
