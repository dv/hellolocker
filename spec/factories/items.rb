# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

FactoryGirl.define do

  factory :item do
    url "http://example.com"
  end

end
