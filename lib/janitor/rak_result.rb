class RakResult
  attr_accessor :rak_output
  
  def initialize(rak_output)
    self.rak_output = rak_output.strip
  end
  
  def file_names
    hits.collect { |hit| hit.file_name }.uniq
  end
  
  def hits
    rak_output.split("\n").collect { |row| RakHit.new(row) }
  end
end
