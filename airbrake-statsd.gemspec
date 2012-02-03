# -*- encoding: utf-8 -*-
require File.expand_path('../lib/airbrake-statsd/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Jim Myhrberg']
  gem.email         = ['contact@jimeh.me']
  gem.description   = 'Increment an exception counter in StatsD whenever ' +
    'the Airbrake gem reports and exception.'
  gem.summary       = 'Increment an exception counter in StatsD whenever ' +
    'the Airbrake gem reports and exception.'
  gem.homepage      = 'http://github.com/jimeh/airbrake-statsd'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'airbrake-statsd'
  gem.require_paths = ['lib']
  gem.version       = Airbrake::Statsd::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'

  gem.add_runtime_dependency 'airbrake'
  gem.add_runtime_dependency 'statsd-ruby'
end
