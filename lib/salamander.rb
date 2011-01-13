require 'ruby-sdl-ffi/gfx'

module Salamander
  require 'salamander/constants'
  require 'salamander/actor'
  require 'salamander/drawing'
  
  def self.setup (width, height)
    SDL.Init(SDL::INIT_VIDEO)
    at_exit { SDL.Quit }
    
    info = SDL.GetVideoInfo
    flags = (info.hw_available) ? SDL::HWSURFACE : SDL::SWSURFACE
    SDL.SetVideoMode(width, height, info.vfmt.BitsPerPixel, flags)
  end
end
