require 'rake'
require 'hanami/rake_tasks'
require './db/seeds'

task seed: :environment do
  Seeds.call
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end
