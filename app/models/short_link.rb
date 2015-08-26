class ShortLink < Link
  validate :ensure_label_is_packed_data, if: :label

  def generate_label
    self.label = ShortLink.generate_random_label(index, salt_count)
  end

  def index
    if label.present?
      Packer.unpack(label).first
    else
      generate_index
    end
  end

  def salt_count
    if label.present?
      Packer.unpack(label).count - 1
    else
      @salt_count
    end
  end

  def salt_count=(new_salt_count)
    if self.salt_count != new_salt_count
      @salt_count = new_salt_count

      if label.present?
        generate_label
      end
    end
  end

  def self.generate_random_label(id, salt_count)
    salt_count ||= 0
    salts = salt_count.times.map { Packer.generate_single_segment_salt }
    data = [id] + salts

    Packer.pack(data)
  end

private

  def generate_index
    @new_index ||= ShortLinkSequence.next
  end

  def ensure_label_is_packed_data
    if Packer.unpack(label).blank?
      errors.add(:label, "is not a valid shortlink")
    end
  end

end
