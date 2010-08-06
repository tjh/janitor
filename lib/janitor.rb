class Janitor
  def self.find (pattern, path="*")
    cmd = "rak -a #{pattern} #{path}"
    puts "Searching for #{pattern} in files #{path}"
    system(cmd)
  end
  
  def self.count (pattern, path="*")
    %x{rak -c -a #{pattern} #{path}}.lines.count
  end
end