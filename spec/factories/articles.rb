FactoryBot.define do
  factory :article do
      title { "test" }
      oshi_point { "Rspec_test" }
      category { :idol }
      color { :red }
      association :user
      after(:build) do |article|
        article.image.attach(io: File.open(Rails.root.join('app/assets/images/Style-love (2).png')), filename: 'Style-love (2).png', content_type: 'image/png')
    end
  end
end
