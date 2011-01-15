module Salamander
  class Canvas
    attr_reader :surface
    
    def initialize (surface)
      @surface = surface
    end
    
    def redraw
      SDL.UpdateRect(surface, 0, 0, width, height)
    end
    
    def point (x, y, color)
      SDL::Gfx.pixelColor(surface, x.round, y.round, color)
    end
    
    def line (x1, y1, x2, y2, color)
      SDL::Gfx.lineColor(surface, x1.round, y1.round, x2.round, y2.round, color)
    end
    
    def arc (x, y, radius, left, right, color)
      SDL::Gfx.arcColor(surface, x.round, y.round, radius.round, left.round, right.round, color)
    end
    
    def circle (x, y, radius, color)
      SDL::Gfx.circleColor(surface, x.round, y.round, radius.round, color)
    end
    
    
    def width
      surface.w
    end
    
    def height
      surface.h
    end
  end
end
