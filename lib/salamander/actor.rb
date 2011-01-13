module Salamander
  class Actor
    def self.draw (screen, filename=nil, &blk)
      actor = new(screen)
      if filename
        actor.instance_eval(File.open(filename).read, filename)
      else
        actor.instance_eval(&blk)
      end
      SDL.UpdateRect(screen, 0, 0, screen.w, screen.h)
    end
    
    def initialize (surface)
      @surface = surface
      
      move_to(surface.w/2, surface.h/2)
      face :north
      color "#FFFFFF"
    end
    
    
    def position
      [@x, @y]
    end
    
    def move (distance)
      x = distance * Math.cos(angle) + @x
      y = distance * Math.sin(angle) + @y
      move_to(x, y)
    end
    
    def move_to (x, y)
      @x, @y = x, y
    end
    
    
    def angle
      @angle
    end
    
    def turn (theta)
      theta = DIRECTIONS[theta] if theta.is_a? Symbol
      face(theta + angle)
    end
    
    def face (theta)
      theta = COMPASS[theta] if theta.is_a? Symbol
      @angle = theta % (2 * Math::PI)
    end
    
    
    def rgba
      @color
    end
    
    def color (color=nil)
      if not color then
        @color
      else
        color = color.to_str
        if color[0] == ?# and color.length == 7
          color = color[1..-1].to_i(16)
          @color = color * (2**8) + 255
        else
          raise "color must be a valid string in the format #RRGGBB"
        end
      end
    end
    
    
    def surface
      @surface
    end
  end
end
