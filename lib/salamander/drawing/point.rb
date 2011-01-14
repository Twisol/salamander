module Salamander::Drawing
  module Point
    def point
      x, y = *position
      SDL::Gfx.pixelColor(surface, x, y, color)
    end
  end
end
