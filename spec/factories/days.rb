FactoryGirl.define do
  factory :day do
    date { Date.new(2016, 12, 1) }

    trait :today do
      date { Date.current }
    end

    trait :tomorrow do
      date { Date.current + 1.day }
    end

    trait :yesterday do
      date { Date.current - 1.day }
    end
  end
end
