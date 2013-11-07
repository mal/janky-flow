require File.expand_path '../lib/janky/flow/version', __FILE__

Gem::Specification.new do |s|
  s.name        = 'janky-flow'
  s.version     = Janky::Flow::VERSION
  s.summary     = 'Git Flow extension for Janky'
  s.description = "Extends Janky's API to expose git-flow friendy endpoints"
  s.authors     = ['Mal Graty']
  s.email       = ['mal.graty@googlemail.com']
  s.files       = ['lib/janky-flow.rb']
  s.homepage    = 'http://rubygems.org/gems/janky-flow'
  s.license     = 'MIT'

  s.files       = %x{ git ls-files *.rb }.split $/

  s.add_dependency 'janky', '~> 0.10'
end
