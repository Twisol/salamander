module Salamander::Drawing
  module Line
    # Draws a line from the current position to (x2, y2) in the current drawing color.
    def line_to (x2, y2)
      x1, y1 = position
      move_to(x2, y2)
      SDL::Gfx.lineColor(surface, x1.round, y1.round, x2.round, y2.round, color)
    end
    
    # Draws a line 'distance' pixels long from the current position in the current drawing color.
    def line (distance, direction=nil)
      x1, y1 = position
      move distance, direction
      x2, y2 = position
      SDL::Gfx.lineColor(surface, x1.round, y1.round, x2.round, y2.round, color)
    end
  end
end
