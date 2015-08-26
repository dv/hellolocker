FactoryGirl.define do

  sequence :label do |n|
    "label-#{n}"
  end

  factory :link do
    label
  end

  factory :short_link do

    after(:build) do |link|
      link.generate_label unless link.label.present?
    end

  end

end
