# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#  user_id    :integer
#

class Item < ActiveRecord::Base
  belongs_to :user

  has_many :links

  validates_presence_of :url, :user
end
