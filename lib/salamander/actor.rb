module Salamander
  class Actor
    DIRECTIONS = {
      :right => 90,
      :left => -90,
      :around => 180,
    }
    DIRECTIONS.each_pair do |k, v|
      DIRECTIONS[k] = v / 180.0 * Math::PI
    end
    
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
    COMPASS.each_pair do |k, v|
      COMPASS[k] = v / 180.0 * Math::PI
    end
    
    
    def initialize (surface)
      @surface = surface
      
      move_to(surface.w/2, surface.h/2)
      face :north
      color "#FFFFFF"
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
      face(theta + angle)
    end
    
    def face (angle)
      if angle.is_a? Symbol
        angle = COMPASS[angle]
      end
      self.theta = angle
    end
    
    def color (color)
      @pen = (color[1..-1].to_i(16) * (2**8)) + 255
    end
    
  private
    def calculate_destination (distance)
      [distance * Math.cos(theta) + @x,
       distance * Math.sin(theta) + @y]
    end
    
    def theta= (angle)
      @theta = angle % (2 * Math::PI)
    end
    
    def theta
      @theta
    end
  end
end
