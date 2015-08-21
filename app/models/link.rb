class Link < ActiveRecord::Base
  belongs_to :item

  validates_uniqueness_of :label

end
