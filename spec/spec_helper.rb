require 'rspec'
require 'rspec/autorun'

require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
  add_filter 'vendor'
end

require 'airbrake-statsd'
