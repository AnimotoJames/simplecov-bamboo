# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'simplecov-html/version'

Gem::Specification.new do |s|
  s.name        = "simplecov-bamboo"
  s.version     = SimpleCov::Formatter::HTMLFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daryl Robbins"]
  s.email       = ["daryl at robbins dot name"]
  s.homepage    = "https://github.com/darylrobbins/simplecov-bamboo"
  s.summary     = %Q{Default HTML formatter for SimpleCov code coverage tool for ruby 1.9+}
  s.description = %Q{Default HTML formatter for SimpleCov code coverage tool for ruby 1.9+}

  s.rubyforge_project = "simplecov-bamboo"
  
  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'simplecov'
  s.add_runtime_dependency 'simplecov-html'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'sprockets'
  s.add_development_dependency 'sass'

  s.add_development_dependency 'appraisal', '~> 0.5.1'
  s.add_development_dependency 'rspec', '~> 2.13.0'
  s.add_development_dependency 'shoulda', '~> 3.4.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end