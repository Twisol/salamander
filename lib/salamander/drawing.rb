module Salamander::Drawing
  %w{point line shapes}.each do |mod|
    require "salamander/drawing/#{mod}"
    include Salamander::Drawing.const_get(mod.capitalize)
  end
end
