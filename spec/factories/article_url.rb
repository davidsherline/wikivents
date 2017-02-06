FactoryGirl.define do
  factory :article_url, class: WikiScraper::URL::Article do
    skip_create

    url { Faker::Internet.url('en.wikipedia.org') }

    initialize_with { new(url) }
  end
end
