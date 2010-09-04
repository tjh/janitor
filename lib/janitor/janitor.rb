class Janitor
  def self.count (pattern, path = "*")
    finder = Finder.new(path)
    count = finder.number_of_matches(pattern)
    raise "Found #{pattern} #{count} times in #{path}" if count > 0
  end
end
