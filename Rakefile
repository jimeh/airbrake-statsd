#!/usr/bin/env rake
require "bundler/gem_tasks"

# Default task
task :default => 'spec'

# Rspec
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :spec do
  RSpec::Core::RakeTask.new(:integration) do |spec|
    spec.pattern = 'spec/integration/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:unit) do |spec|
    spec.pattern = 'spec/unit/**/*_spec.rb'
  end
end
