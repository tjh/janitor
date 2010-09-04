class RakResult
  attr_accessor :rak_output
  
  def initialize(rak_output)
    self.rak_output = rak_output
  end
  
  def files
    rows = rak_output.split("\n")
    rows.select { |r| r.scan(/^[^\s]+/).size > 0 }
  end
end