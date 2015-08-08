FactoryGirl.define do
  sequence :email do |n|
    "my-#{n.ordinalize}-favorite-person@example.com"
  end

  factory :user do
    email
    password "password"

    factory :master do
      master true
    end
  end
end
