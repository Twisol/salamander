module Salamander::Drawing
  module Line
    def draw_to (x2, y2)
      x1, y1 = position
      move_to(x2, y2)
      SDL::Gfx.aalineColor(surface, x1.round, y1.round, x2.round, y2.round, color)
    end
    
    def draw (distance)
      x1, y1 = position
      move distance
      x2, y2 = position
      SDL::Gfx.aalineColor(surface, x1.round, y1.round, x2.round, y2.round, color)
    end
  end
end
