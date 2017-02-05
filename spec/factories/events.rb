FactoryGirl.define do
  factory :event do
    title { Faker::Commerce.product_name }
    summary { Faker::Hipster.paragraph }
    image_url { Faker::LoremPixel.image }
    day
  end
end
