module Salamander
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
end
