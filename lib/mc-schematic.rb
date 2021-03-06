require 'mc-schematic/version'
require 'mc-schematic/array_helper'
require 'mc-schematic/block'
require 'zlib'
require 'nbtfile'
require 'json'

module MCSchematic
  class SchematicFile
    attr_reader :type
    attr_accessor :nbt
    attr_accessor :blocks
    attr_accessor :data
    attr_accessor :width
    attr_accessor :height
    attr_accessor :length

    def initialize(file)
      data = nil
      data = file.read if file.is_a? File
      data = file if file.is_a? String
      if data == nil
        raise MCSchematic::SchematicException::UnreadableFile.new 'Could not read file!'
      end
      @nbt = NBTFile.read data
      MCSchematic.check_format @nbt
      schem = @nbt[1]
      @type = 'worldedit' if schem['WEOffsetX']
      @blocks = schem['Blocks'].value.bytes
      @data = schem['Data'].value.bytes
      @width = schem['Width'].value
      @height = schem['Height'].value
      @length = schem['Length'].value
    end

    def get_block_multi_array
      MCSchematic::ArrayHelper.multi_array blocks, width, height, length
    end

    def get_block(x, y, z)
      id = get_block_id x, y, z
      data = get_block_data x, y, z
      Block.new id, data, x, y, z
    end

    def get_block_id(x, y, z)
      MCSchematic::ArrayHelper.get_element @blocks, x, y, z, @width, @height, @length
    end

    def get_block_data(x, y, z)
      MCSchematic::ArrayHelper.get_element @data, x, y, z, @width, @height, @length
    end

  end

  def self.new(file)
    SchematicFile.new file
  end

  def self.check_format(nbt)
    raise_format_error 'NBT must an array at the root' unless nbt.is_a? Array
    raise_format_error 'NBT must have "Schematic" name' unless nbt[0] == 'Schematic'
    raise_format_error 'NBR must have a compound tag after "Schematic"' unless nbt[1].is_a? NBTFile::Types::Compound
  end


  module SchematicException
    class UnreadableFile < StandardError
      attr_reader :obj
      def initialize(obj)
        @obj = obj
      end
    end
    class IncorrectFormat < StandardError
      attr_reader :obj
      def initialize(obj)
        @obj = obj
      end
    end
  end

  def self.raise_format_error(reason)
    raise SchematicException::IncorrectFormat.new reason
  end

  def self.resource_path(path)
    File.expand_path('../../' + path, __FILE__)
  end

  @@image_json

  def self.initialize_image_json
    @@image_json = JSON.parse IO.read(resource_path('db/image_data.json'))
  end

  initialize_image_json

  def self.get_block_name(id)
    @@image_json['block_ids'].each_pair do |block, block_id|
      return block if block_id == id
    end
    nil
  end

  def self.get_block_image_path(name)
    resource_path('images/minecraft/blocks/' + name + '.png')
  end

end
