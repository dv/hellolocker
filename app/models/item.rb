# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

class Item < ActiveRecord::Base
  has_many :links

  validates_presence_of :url
end
