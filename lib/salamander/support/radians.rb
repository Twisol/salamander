class Numeric
  # Converts from radians to degrees.
  def radians
    self * 180.0 / Math::PI
  end
  
  # Does nothing - input is assumed to be degrees already
  def degrees
    self
  end
end
