FactoryBot.define do
  factory :comment do
    body {"test"}

    association :article
    association :user
  end
end
