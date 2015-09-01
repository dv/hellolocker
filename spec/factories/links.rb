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
    label_type "custom"
  end

end
