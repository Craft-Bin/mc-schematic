module MCSchematic
  class ArrayHelper
    # Create a multidimensional array
    def self.multi_array(data, width, height, length)
      blocks = []
      for y in 0..(height - 1)
        y_blocks = []
        for x in 0..(width - 1)
          x_blocks = []
          for z in 0..(length - 1)
            x_blocks << data[(width * length) * y + (x * length + z)]
          end
          y_blocks << x_blocks
        end
        blocks << y_blocks
      end
      blocks
    end
    # Gets the 'surface' of a multidimensional array
    def get_surface(data)
      blocks = []
      for y in 0..(data.length - 1)
        for x in 0..(data[y].length - 1) do
          for z in 0..(data[y][x].length - 1) do
            block = data[y][x][z]
            if y == 0
              blocks[x] = [] if blocks[x] == nil
              blocks[x][z] = block
              next
            end
            if block != 0
              blocks[x] = [] if blocks[x] == nil
              blocks[x][z] = block
            end
          end
        end
      end
      blocks
    end
    
  end
end
