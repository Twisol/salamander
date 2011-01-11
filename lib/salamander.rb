require 'ruby-sdl-ffi/gfx'

module Salamander
  require 'salamander/actor'
  
  def self.setup (width, height)
    SDL.Init(SDL::INIT_VIDEO)
    at_exit { SDL.Quit }
    
    info = SDL.GetVideoInfo
    flags = (info.hw_available) ? SDL::HWSURFACE : SDL::SWSURFACE
    @screen = SDL.SetVideoMode(width, height, info.vfmt.BitsPerPixel, flags)
  end
  
  def self.draw (&blk)
    Actor.new(@screen).instance_eval(&blk)
    SDL.UpdateRect(@screen, 0, 0, @screen.w, @screen.h)
  end
end
