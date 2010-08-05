namespace :janitor do
  desc "Find any 'debugger statements"
  task :cleanup do
    exec "rak debugger"
  end
end
