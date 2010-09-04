class Finder
  attr_reader :path
  
  def initialize(path = File.dirname(__FILE__))
    @path = path
  end
  
  def number_of_matches(pattern)
    rak_result = search_by_regex(pattern)
    rak_result.files.size
  end
  
  def search_by_regex(pattern)
    exec_rak(pattern, '-all')
  end
  
  def exec_rak(pattern, options)
    RakResult.new(%x{rak #{options} #{pattern} #{@path}})
  end
end
