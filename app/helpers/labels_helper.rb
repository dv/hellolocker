module LabelsHelper

  def label_path(link)
    label_link_path(label: link.label)
  end

  def label_url(link)
    label_link_url(label: link.label)
  end

end
