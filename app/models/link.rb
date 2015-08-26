class Link < ActiveRecord::Base
  belongs_to :item

  validates :label, presence: true, uniqueness: true
end
