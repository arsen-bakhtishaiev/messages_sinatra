require './main'
require 'sinatra/activerecord/rake'
require 'rubygems'
begin
 	require 'rspec/core/rake_task'
 	RSpec::Core::RakeTask.new(:spec)
	rescue LoadError
end

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end