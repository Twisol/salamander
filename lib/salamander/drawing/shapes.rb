module Salamander::Drawing
  module Shapes
    include Line
    
    def star (points, length)
      raise "The star must have an odd number of points" if points % 2 == 0
      points.times do
        draw length
        turn (720.0/points).degrees
      end
    end
    
    def polygon (sides, length)
      sides.times do
        draw length
        turn (360.0/sides).degrees
      end
    end
  end
end
