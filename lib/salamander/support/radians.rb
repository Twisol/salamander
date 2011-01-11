class Numeric
  # Input assumed to be radians
  def radians
    self
  end
  
  # Input assumed to be degrees
  # Convert to radians
  def degrees
    self / 180.0 * Math::PI
  end
end
