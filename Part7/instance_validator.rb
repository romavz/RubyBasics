module InstanceValidator
  def valid?
    validate!
    true
  rescue
    false
  end
end
