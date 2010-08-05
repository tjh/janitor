namespace :janitor do
  desc "Find any rogue statements"
  task :cleanup do
    @commands = []
    Rake::Task["janitor:find:all"].invoke
  end
  
  namespace :find do
    task :all => [:debugger, :console_log]
    
    desc "Find any 'debugger' statements"
    task :debugger do
      system("rak -a debugger")
    end
    
    desc "Find any 'console.log' statements"
    task :console_log do
      system("rak -a 'console.log' tmp/javascript")
    end
  end
end
