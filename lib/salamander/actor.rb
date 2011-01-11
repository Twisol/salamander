module Salamander
  class Actor
    DIRECTIONS = {
      :right => 90,
      :left => -90,
      :around => 180,
    }
    
    COMPASS = {
      :east => 0,
      :northeast => 315,
      :north => 270,
      :northwest => 225,
      :west => 180,
      :southwest => 135,
      :south => 90,
      :southeast => 45,
    }
    
    def initialize (surface)
      @surface = surface
      
      move_to(surface.w/2, surface.h/2)
      face :north
      color 0xFFFFFFFF
    end
    
    def move_to (x, y)
      @x, @y = x, y
    end
    
    def move (distance)
      move_to(*calculate_destination(distance))
    end
    
    def draw_to (x, y)
      SDL::Gfx.lineColor(@surface, @x.round, @y.round, x.round, y.round, @pen)
      move_to(x, y)
    end
    
    def draw (distance)
      draw_to(*calculate_destination(distance))
    end
    
    def turn (angle)
      if angle.is_a? Symbol
        angle = DIRECTIONS[angle]
      end
      @angle = (@angle + angle) % 360
    end
    
    def face (angle)
      if angle.is_a? Symbol
        angle = COMPASS[angle]
      end
      @angle = angle % 360
    end
    
    def color (color)
      if color.is_a? String
        r, g, b = color.scan(/[0-9A-Fa-f]{2}/).map {|c| c.to_i(16)}
      end
      @pen = color
    end
    
  private
    def calculate_destination (distance)
      [distance * Math.cos(@angle / 180.0 * Math::PI) + @x,
       distance * Math.sin(@angle / 180.0 * Math::PI) + @y]
    end
  end
end
