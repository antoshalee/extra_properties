$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "extra_properties/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "extra_properties"
  s.version     = ExtraProperties::VERSION
  s.authors     = ["Anton Lee"]
  s.email       = ["antoshalee@gmail.com"]
  s.homepage    = "https://github.com/antoshalee/extra_properties"
  s.summary     = "TODO: Summary of ExtraProperties."
  s.description = "TODO: Description of ExtraProperties."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
