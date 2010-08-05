require 'rubygems'
require 'rake'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'lib/tasks','*'))].sort.each {|f| load f}

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "janitor"
    gem.summary = "janitor scans your code for leftover debug statements, consolr logs, and vulgarity"
    gem.description = "ever leave a breakpoint in your code and do a deploy? not good, right? maybe you just want to remove the logger.info calls from your Rails project. janitor cleans your code"
    gem.email = "mike@mikekrisher.com"
    gem.homepage = "http://github.com/tjh/janitor"
    gem.authors = ["Tim Harvey", "Michael Krisher"]
    gem.add_development_dependency "rak", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "janitor #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
