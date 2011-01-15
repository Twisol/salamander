module Salamander::Drawing
  module Point
    def point
      x, y = position
      canvas.point(x, y, color)
    end
  end
end
