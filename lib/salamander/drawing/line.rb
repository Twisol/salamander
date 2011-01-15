module Salamander::Drawing
  module Line
    # Draws a line from the current position to (x2, y2) in the current drawing color.
    def line_to (x2, y2)
      x1, y1 = position
      move_to(x2, y2)
      canvas.line(x1, y1, x2, y2, color)
    end
    
    # Draws a line 'distance' pixels long from the current position in the current drawing color.
    def line (distance, direction=nil)
      x1, y1 = position
      move distance, direction
      x2, y2 = position
      canvas.line(x1, y1, x2, y2, color)
    end
  end
end
