# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'simplecov-bamboo/version'

Gem::Specification.new do |s|
  s.name        = "simplecov-bamboo"
  s.version     = SimpleCov::Formatter::BambooFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daryl Robbins"]
  s.email       = ["daryl at robbins dot name"]
  s.homepage    = "https://github.com/darylrobbins/simplecov-bamboo"
  s.summary     = %Q{SimpleCov/Bamboo Integration}
  s.description = %Q{Integrate SimpleCov results into Atlassian Bamboo CI server}
  s.license     = 'MIT'

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