module Salamander::Drawing
  module Circle
    def arc(rotation, radius)
      direction = (rotation > 0.degrees) ? :right : :left
      
      # Enter the center of the arc's circle
      turn direction  # Turn towards the center point
      move radius     # Move to the center point
      turn :around    # Face the first endpoint of the arc
     
      # Draw the arc
      x, y = position
      if rotation > 0.degrees
        canvas.arc(x, y, radius, angle, angle+rotation, color)
      else
        canvas.arc(x, y, radius, angle+rotation, angle, color)
      end
      
      # Move to the opposite side of the arc
      turn rotation.degrees
      move radius
      turn direction
    end
    
    def circle(radius)
      x, y = position
      canvas.circle(x, y, radius, color)
    end
  end
end
