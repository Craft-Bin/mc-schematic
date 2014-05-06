class Locatable

  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

  def initialize(x=0, y=0, z=0)
    set_coords x, y, z
  end

  def set_coords(x, y, z)
    @x = x
    @y = y
    @z = z
  end

end