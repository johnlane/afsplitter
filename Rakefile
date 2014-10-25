require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:ffi) { |t| t.test_files = %w(test/test_afsplitter_ffi.rb) }
Rake::TestTask.new(:native) { |t| t.test_files = %w(test/test_afsplitter.rb) }

desc "Run all tests"
task :default => [:ffi, :native]

desc "Run FFI test"
task :ffi

desc "Test native Ruby implementation"
task :native
