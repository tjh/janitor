require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Janitor" do
  describe " #count" do
    it "should call number_of_matches on Finder with the given path" do
      path    = "a_path"
      pattern = "a_pattern"
      mock_finder(pattern, path)
      Janitor.count(pattern, path)
    end
    
    it "should return the value returned by the call to number_of_matches" do
      path    = "a_path"
      pattern = "a_pattern"
      mock_finder(pattern, path, :number_of_matches => 1)
      Janitor.count(pattern, path).should == 1
    end
  end
  
  describe " #hits" do
    it "should call #hits on Finder and return the result" do
      path    = "a_path"
      pattern = "a_pattern"
      hits    = ['result']
      mock_finder(pattern, path, :hits => hits)
      Janitor.hits(pattern, path).should == hits
    end
  end
  
  def mock_finder(pattern, path, *args)
    options = args.first ? args.first : {}
    options = {:number_of_matches => 0}.merge options
    options = {:hits              => 0}.merge options
    finder = mock('finder', 
      :number_of_matches => options[:number_of_matches],
      :hits              => options[:hits])
    Finder.should_receive(:new).and_return(finder)
  end
end
