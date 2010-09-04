require 'janitor'

namespace :janitor do
  namespace :count do
    desc "Run all count tasks"
    task :all => [:debugger, :console_log]
    
    desc "Find any 'console.log' statements"
    task :console_log do
      count = Janitor.count "console.log"
      if count > 0
        puts "FAILED: Found #{count} console.log statements"
      end
    end
    
    desc "Count 'debugger' statements"
    task :debugger do
      count = Janitor.count "debugger"
      if count > 0
        puts "FAILED: Found #{count} debugger statements"
      end
    end
  end
end
