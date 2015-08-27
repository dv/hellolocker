class LabelMaker

  def generate_short_label(index:, salt_count: 0)
    salts = salt_count.times.map { Packer.generate_single_segment_salt }
    data = [index] + salts

    Packer.pack(data)
  end

end
