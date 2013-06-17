$:.unshift File.expand_path("../lib", __FILE__)

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/humble_editor/**/test_*.rb'].exclude(/test_helper\.rb/)
end

Rake::TestTask.new(:acceptance_test) do |t|
  t.libs << "test"
  t.test_files = FileList['test/acceptance/**/test_*.rb'].exclude(/test_helper\.rb/)
end

task :default => [:test, :acceptance_test]

