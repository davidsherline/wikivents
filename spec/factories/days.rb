FactoryGirl.define do
  factory :day do
    date { Faker::Date.between(Date.new(2000, 1, 1), Date.current) }

    trait :today do
      date { Date.current }
    end

    trait :tomorrow do
      date { Date.current + 1.day }
    end

    trait :yesterday do
      date { Date.current - 1.day }
    end

    factory :day_with_events do
      transient do
        events_count 5
      end

      after(:create) do |day, evaluator|
        create_list(:event, evaluator.events_count, day: day)
      end
    end
  end
end
