class Janitor
  def self.find (pattern, path="*")
    cmd = "rak -a #{pattern} #{path}"
    puts "Searching for #{pattern} in files #{path}"
    system(cmd)
  end
  
  def self.count (path, pattern)
    finder = Finder.new(path)
    count = finder.number_of_matches(pattern)
    raise "Found #{pattern} #{count} times in #{path}" if count > 0
  end
end
