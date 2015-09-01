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

class Link < ActiveRecord::Base
  LABEL_TYPES = %w(short guid custom)

  belongs_to :item

  validates :label, presence: true, uniqueness: true
  validates :label_type, inclusion: {in: LABEL_TYPES}

  attr_accessor :short_id, :salt_count

  def url(options = {})
    options[:label] = label

    Rails.application.routes.url_helpers.label_link_url(options)
  end

  def self.build_short_link
    salt_count = 1
    short_id = ShortLabelSequence.next
    label = LabelMaker.new.generate_short_label(salt_count: salt_count, index: short_id)

    new(label_type: "short", label: label, salt_count: salt_count, short_id: short_id)
  end

end
