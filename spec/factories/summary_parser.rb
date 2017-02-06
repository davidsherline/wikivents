FactoryGirl.define do
  factory :summary_parser, class: WikiScraper::Parser::Summary do
    skip_create

    transient do
      document { Nokogiri::HTML(File.new('spec/fixtures/files/summary.html')) }
    end

    initialize_with { new(document) }
  end
end
