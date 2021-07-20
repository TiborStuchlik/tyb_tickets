require "bundler/setup"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"

require "rake/testtask"

require 'rdoc/task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_dir = "html/doc"
  rdoc.rdoc_files.include("README.md", "lib   /*.rb", "app/models/tyb_tickets   /*.rb")
end

task default: :test
