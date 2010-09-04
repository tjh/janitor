require 'rubygems'
require 'rake'

$:.unshift 'lib'

Dir["#{File.dirname(__FILE__)}/lib/tasks/*.rake"].sort.each { |ext| load ext }

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "janitor"
    gem.summary = "janitor scans your code for leftover debug statements, consolr logs, and vulgarity"
    gem.description = "ever leave a breakpoint in your code and do a deploy? not good, right? maybe you just want to remove the logger.info calls from your Rails project. janitor cleans your code"
    gem.email = "mike@mikekrisher.com"
    gem.homepage = "http://github.com/tjh/janitor"
    gem.authors = ["Tim Harvey", "Michael Krisher"]
    gem.add_dependency "rak"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
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

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

