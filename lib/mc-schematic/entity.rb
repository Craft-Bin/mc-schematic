require 'mc-schematic/locatable'
class Entity < Locatable

  attr_accessor :id
  attr_accessor :name

  def initialize(id, x=0, y=0, z=0)
    @id = id
    set_coords x, y, z
  end

end