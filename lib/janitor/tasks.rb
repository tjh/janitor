require 'janitor'

namespace :janitor do
  namespace :count do
    desc "Run all count tasks"
    task :all => [:debugger, :console_log]
    
    desc "Find any 'console.log' statements"
    task :console_log do
      count = Janitor.count "console.log", "tmp/javascript"
      raise "Found console.log statements" if count > 0
    end
    
    desc "Count 'debugger' statements"
    task :debugger do
      count = Janitor.count "debugger"
      raise "Found debugger statements" if count > 0
    end
  end
  
  desc "Find any pattern in files"
  task :find, [:pattern, :path] do |t, args|
    args.with_defaults(:path => "*")
    Janitor.find args.pattern args.path
  end
  
  namespace :find do
    desc "Run all find tasks"
    task :all => [:debugger, :console_log]
    
    desc "Find any 'debugger' statements"
    task :debugger do
      Janitor.find "debugger"
    end
    
    desc "Find any 'console.log' statements"
    task :console_log do
      Janitor.find "console.log", "tmp/javascript"
    end
  end
end
