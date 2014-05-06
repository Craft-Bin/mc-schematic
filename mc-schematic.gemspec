# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mc-schematic/version'

Gem::Specification.new do |spec|
  spec.name          = "mc-schematic"
  spec.version       = MCSchematic::VERSION
  spec.authors       = ['August']
  spec.email         = ['augustt198@gmail.com']
  spec.description   = %q{Gem for handling Minecraft schematics}
  spec.summary       = %q{Gem for handling Minecraft schematics}
  spec.homepage      = "http://github.com/Craft-Bin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'nbtfile', '~> 0.2.0'
end
