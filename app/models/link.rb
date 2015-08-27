class Link < ActiveRecord::Base
  belongs_to :item

  validates :label, presence: true, uniqueness: true

  def url(options = {})
    options[:label] = label

    Rails.application.routes.url_helpers.label_link_url(options)
  end

  def self.build_short_link
    index = ShortLabelSequence.next
    label = LabelMaker.new.generate_short_label(salt_count: 1, index: index)

    new(label: label)
  end

end
