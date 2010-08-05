namespace :janitor do
  desc "Find any rogue statements"
  task :cleanup do
    @commands = []
    Rake::Task["janitor:find:all"].invoke
    
    exec @commands.join(";")
  end
  
  namespace :find do
    task :all => [:debugger, :console_log]
    
    desc "Find any 'debugger' statements"
    task :debugger do
      command = "rak -a debugger"
      @commands.nil? ? exec(command) : @commands << command
    end
    
    desc "Find any 'console.log' statements"
    task :console_log do
      command = "rak -a 'console.log' tmp/javascript"
      @commands.nil? ? exec(command) : @commands << command
    end
  end
end
