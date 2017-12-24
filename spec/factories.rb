FactoryBot.define do
  factory :user do
    username "mfbmina"
    email  "mfbmina@gmail.com"
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
