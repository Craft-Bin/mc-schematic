# mc-schematic

Ruby gem for handling Minecraft schematic files.

## Installation

If you're using bundler, you can build from git:
```ruby
gem 'mc-schematic', github: 'craft-bin/mc-schematic'
```

## Usage
Create a schematic object by suppling either a `String`, `File`, or `GzipFile`
```ruby
MCSchematic.new File.open('path-to-your-.schematic-file')
```

## Images
This gem comes with block and item images. If you're using rails, you can copy the images into your `public` folder by
loading the rake task `images.rake` into your `Rakefile`