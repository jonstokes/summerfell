FactoryGirl.define do
  factory :package do
    sequence(:name) { |n| "Package #{n}"  }
    sequence(:charged_as) { |n| "Package #{n} Charge"  }
    price_cents 1000
    currency 'USD'
    duration_minutes 100
    description { Forgery(:lorem_ipsum).words(10) }
    limit_up 10
    limit_down 10
  end
end
