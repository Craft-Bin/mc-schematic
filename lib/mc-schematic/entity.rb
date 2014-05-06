class Entity < Locatable

  attr_accessor :id
  attr_accessor :name

  def initialize(id)
    @id = id
  end

end