require 'janitor'

namespace :janitor do
  namespace :count do
    desc "Run all count tasks"
    task :all => [:debugger, :console_log]
    
    desc "Find any 'console.log' statements"
    task :console_log do
      puts "Searching the current folder for 'console.log'"
      count = Janitor.count "console.log"
      if count > 0
        puts "FAILED: Found #{count} console.log statements"
      else
        puts "Success...didn't find 'console.log'"
      end
    end
    
    desc "Count 'debugger' statements"
    task :debugger do
      puts "Searching the current folder for 'debugger'"
      count = Janitor.count "debugger"
      if count > 0
        puts "FAILED: Found #{count} debugger statements"
      else
        puts "Success...didn't find 'debugger'"
      end
    end
  end
  
  namespace :hits do
    desc "Run all count tasks"
    task :all => [:debugger, :console_log]
    
    desc "Find any 'console.log' statements"
    task :console_log do
      hits = Janitor.hits "console.log"
      if hits.count > 0
        puts hits
        puts "FAILED: Found #{hits.count} console.log statements"
      end
    end
    
    desc "Count 'debugger' statements"
    task :debugger do
      puts "Searching the current folder for 'debugger'"
      hits = Janitor.hits "debugger"
      if hits.count > 0
        puts hits
        puts "FAILED: Found #{hits.count} debugger statements"
      else
        puts "Success...didn't find 'debugger'"
      end
    end
  end
end
