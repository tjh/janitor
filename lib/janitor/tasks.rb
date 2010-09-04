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
end
