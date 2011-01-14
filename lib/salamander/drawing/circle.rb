module Salamander::Drawing
  module Circle
    def arc(rotation, radius)
      if rotation < 0
        # Enter the center of the arc's circle
        move radius, :left
        turn :right
        
        # Draw the arc
        x, y = position
        theta = angle * 180.0 / Math::PI
        SDL::Gfx.arcColor(surface, x.round, y.round, radius, theta+rotation, theta, color)
        
        # Move to the opposite side of the arc
        turn rotation.degrees
        move radius
        turn :left
      else
        move radius, :right
        turn :left
        
        x, y = position
        theta = angle * 180.0 / Math::PI
        SDL::Gfx.arcColor(surface, x.round, y.round, radius, theta, theta+rotation, color)
        
        turn rotation.degrees
        move radius
        turn :right
      end
    end
    
    def circle(radius)
      x, y = position
      SDL::Gfx.circleColor(surface, x, y, radius, color)
    end
  end
end
