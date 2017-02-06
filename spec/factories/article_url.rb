FactoryGirl.define do
  factory :article_url, class: WikiScraper::URL::Article do
    skip_create

    path { "/#{Faker::Internet.domain_word}/#{Faker::Internet.domain_word}" }

    initialize_with { new(path) }
  end
end
