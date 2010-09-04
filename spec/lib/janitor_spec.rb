require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Janitor" do
  describe " #count" do
    it "should call number_of_matches on Finder with the given path" do
      path    = "a_path"
      pattern = "a_pattern"
      finder = mock('finder')
      finder.should_receive(:number_of_matches).with(pattern).and_return(0)
      Finder.should_receive(:new).with(path).and_return(finder)
      Janitor.count(path, pattern)
    end
    
    it "should raise an exception when number_of_matches returns a non-zero count" do
      path    = "a_path"
      pattern = "a_pattern"
      finder = mock('finder')
      finder.should_receive(:number_of_matches).with(pattern).and_return(1)
      Finder.should_receive(:new).with(path).and_return(finder)
      lambda { Janitor.count(path, pattern) }.should raise_error
    end
  end
end
