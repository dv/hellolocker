# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label      :string
#  item_id    :integer
#  label_type :string
#

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
