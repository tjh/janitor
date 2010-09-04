require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Finder" do
  describe " #initialize" do
    it "should store the given path" do
      finder = Finder.new('a_path')
      finder.path.should == 'a_path'
    end
  end
  
  describe " #number_of_matches" do
    it "should do a search_by_regex, returning the number of hits the RakResult gives" do
      pattern = 'a_regex'
      finder = Finder.new
      rak_result = mock('rak_result', :hits => ['janitor.rb:3'])
      finder.should_receive(:search_by_regex).with(pattern).and_return(rak_result)
      finder.number_of_matches(pattern).should == 1
    end
  end
  
  describe " #hits" do
    it "should return the array of hits from the RakResult returned by exec_rak" do
      pattern = 'a_regex'
      hit        = mock('rak_hit', 
        :file_name => "filename.rb",
        :line_number => 10)
      rak_result = mock('rak_result', :hits => [hit])
      finder = Finder.new
      finder.should_receive(:search_by_regex).and_return(rak_result)
      finder.hits(pattern).should == ["filename.rb:10"]
    end
  end
  
  describe " #search_by_regex" do
    it "should execute a rak search with the given pattern and -all" do
      pattern = 'a_regex'
      finder = Finder.new
      finder.should_receive(:exec_rak).with(pattern, '--all')
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
