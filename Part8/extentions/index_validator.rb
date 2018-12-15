module IndexValidator
  def validate_index!(index, max_index)
    return if index.between(1, max_index)

    raise ArgumentError, index_out_of_range_msg + max_index.to_s
  end
end
