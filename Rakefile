require 'rake'
require 'hanami/rake_tasks'

task seed: :environment do
  SeedInteractor.new.call
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end
