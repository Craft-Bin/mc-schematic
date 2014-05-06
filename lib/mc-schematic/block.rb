require 'mc-schematic/locatable'
class Block < Locatable

  attr_accessor :id
  attr_accessor :data

  def initialize(id, data=0, x=0, y=0, z=0)
    @id = id
    @data = data
    set_coords x, y, z
  end

end