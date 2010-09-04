require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Finder" do
  describe " #initialize" do
    it "should store the given path" do
      finder = Finder.new('a_path')
      finder.path.should == 'a_path'
    end
  end
  
  describe " #search_by_regex" do
    it "should execute a rak search with the given pattern and -all" do
      pattern = 'a_regex'
      finder = Finder.new
      finder.should_receive(:exec_rak).with(pattern, '-all')
      finder.search_by_regex(pattern)
    end
  end
  
  describe " #exec_rak" do
    it "should return a RakResult instance" do
      pattern = 'a_regex'
      finder = Finder.new
      finder.exec_rak('search', 'option').should be_instance_of(RakResult)
    end
  end
end
