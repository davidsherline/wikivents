FactoryGirl.define do
  factory :summary_url, class: WikiScraper::URL::Summary do
    skip_create

    date { Faker::Date.between(Date.new(2000, 1, 1), Date.current) }

    initialize_with { new(date) }
  end
end
