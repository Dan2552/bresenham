MRuby::Gem::Specification.new("mruby-bresenham") do |spec|
  spec.license = "MIT"
  spec.authors = "Daniel Inkpen"
  spec.rbfiles = Dir.glob(File.join(__dir__, "lib", "bresenham", "**", "*.rb"))
end
