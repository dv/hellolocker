class Link < ActiveRecord::Base
  belongs_to :item

  validates :label, presence: true, uniqueness: true

  attr_accessor :short_id, :salt_count

  def url(options = {})
    options[:label] = label

    Rails.application.routes.url_helpers.label_link_url(options)
  end

  def self.build_short_link
    salt_count = 1
    short_id = ShortLabelSequence.next
    label = LabelMaker.new.generate_short_label(salt_count: salt_count, index: short_id)

    new(label: label, salt_count: salt_count, short_id: short_id)
  end

end
