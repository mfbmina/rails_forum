FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "mfbmina#{n}"
    end
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "123123"
  end

  factory :topic do
    subject "The BEST topic ever"
    user
  end

  factory :post do
    content "I agree with you!"
    user
    topic
  end
end
