module Salamander
  class Actor
    # Executes code within the context of an Actor.
    #
    # If given a filename, reads the contents and evaluates it.
    def self.draw (canvas, filename=nil, &blk)
      actor = new(canvas)
      if filename
        actor.instance_eval(File.open(filename).read, filename)
      else
        actor.instance_eval(&blk)
      end
    end
    
    def initialize (canvas)
      @canvas = canvas
      
      move_to(canvas.width/2, canvas.height/2)
      face :north
      color "#FFFFFF"
    end
    
    
    # Get the current position as an array.
    def position
      [@x, @y]
    end
    
    # Move a given distance
    def move (distance, direction=nil)
      if direction
        theta = (direction.is_a?(Symbol) ? COMPASS[direction] : direction)
      else
        theta = angle
      end
      theta = theta / 180.0 * Math::PI
      x = distance * Math.cos(theta) + @x
      y = distance * Math.sin(theta) + @y
      move_to(x, y)
    end
    
    # Move to a specific point
    def move_to (x, y)
      @x, @y = x, y
    end
    
    
    # The current angle, in degrees.
    def angle
      @angle
    end
    
    # Turn towards a new direction.
    #
    # 'theta' may be :right, :left, :around, or a number of degrees. Positive amounts of degrees turn right, while negative amounts go to the left.
    def turn (theta)
      theta = DIRECTIONS[theta] if theta.is_a? Symbol
      face(theta + angle)
    end
    
    # Face a specific direction.
    #
    # 'theta' may be :north, :northeast, :east, etc. or a number of degrees. 0 degrees points east, and increasing amounts go clockwise.
    def face (theta)
      theta = COMPASS[theta] if theta.is_a? Symbol
      @angle = theta % 360
    end
    
    # Gets or sets the current drawing color in numeric RGBA format.
    #
    # If 'color' is nil, gets the current color.
    # Otherwise, 'color' must be in "#RRGGBB" notation.
    def color (color=nil)
      if not color then
        @color
      else
        color = COLORS[color] if color.is_a? Symbol
        color = color.to_str
        if color[0] == ?# and color.length == 7
          color = color[1..-1].to_i(16)
          @color = color * (2**8) + 255
        else
          raise "color must be a valid string in the format #RRGGBB"
        end
      end
    end
    
    
    # The drawing canvas being used
    def canvas
      @canvas
    end
  end
end
