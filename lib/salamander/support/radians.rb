class Numeric
  # Does nothing - input is assumed to be radians already
  def radians
    self
  end
  
  # Converts from degrees to radians.
  def degrees
    self / 180.0 * Math::PI
  end
end
