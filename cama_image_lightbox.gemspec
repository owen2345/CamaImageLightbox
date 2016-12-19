$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cama_image_lightbox/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cama_image_lightbox"
  s.version     = CamaImageLightbox::VERSION
  s.authors     = ["Owen Peredo"]
  s.email       = ["owenperedo@gmail.com"]
  s.homepage    = ""
  s.summary     = "Camaleon CMS Plugin to display images in popup."
  s.description = "Camaleon CMS Plugin to display images in popup."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">=4.1"
  s.add_development_dependency "sqlite3"
end
