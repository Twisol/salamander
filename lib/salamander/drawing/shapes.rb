module Salamander::Drawing
  module Shapes
    include Line
    
    # Draws a star-like shape with number 'points' of points.
    #
    # 'points' must be odd.
    def star (points, length)
      raise "The star must have an odd number of points" if points % 2 == 0
      points.times do
        line length
        turn (720.0/points).degrees
      end
    end
    
    # Draws a regular polygon with 'sides' sides, each of length 'length'
    def polygon (sides, length)
      sides.times do
        line length
        turn (360.0/sides).degrees
      end
    end
  end
end
