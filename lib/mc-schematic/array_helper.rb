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
  end
end
