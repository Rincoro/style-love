FactoryBot.define do
  factory :item do
    name { "item" }
    brand { "brand" }
    item_category { :tops }
    association :article
  end
end
