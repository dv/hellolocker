FactoryGirl.define do

  sequence :label do |n|
    "label-#{n}"
  end

  factory :link do

  end

  factory :short_link do

    trait :with_label do
      after(:build) do |link|
        link.generate_label
      end
    end

  end

end
