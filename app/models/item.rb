class Item < ActiveRecord::Base
  has_many :links

  validates_presence_of :url
end
