class Janitor
  def self.count (pattern, path = "*")
    finder = Finder.new(path)
    finder.number_of_matches(pattern)
  end
  
  def self.hits (pattern, path = "*")
    finder = Finder.new(path)
    finder.hits(pattern)
  end
end
