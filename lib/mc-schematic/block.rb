class Block < Locatable

  attr_accessor :id
  attr_accessor :data

  def initialize(id, data=nil)
    @id = id
    @data = data
  end

end