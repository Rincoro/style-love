FactoryBot.define do
  factory :user do
    name { "user" }
    email {"Rspec@test"}
    password { "secure_password" }
    password_confirmation { "secure_password" }  
  end
end
