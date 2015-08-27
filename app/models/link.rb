class Link < ActiveRecord::Base
  belongs_to :item

  validates :label, presence: true, uniqueness: true

  def url(options = {})
    options[:label] = label

    Rails.application.routes.url_helpers.label_link_url(options)
  end

end
