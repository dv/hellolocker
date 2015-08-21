class Label
  attr :link

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(link)
    @link = link
  end

  def to_param
    link.label
  end

  def persisted?
    true
  end

end

def Label(object)
  case object
  when Link
    Label.new(object)
  else
    raise ArgumentError
  end
end
