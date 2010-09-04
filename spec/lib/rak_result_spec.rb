require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "RakResult" do
  before(:all) do
      @result = "
lib/janitor.rb   1|require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
lib/janitor.rb   9|end
lib/finder.rb   7|Dir.glob(File.join(File.dirname(__FILE__), '../lib/*.rb')).each {|f| require f }
lib/finder.rb   9|Spec::Runner.configure do |config|
lib/finder.rb  11|end
"
  end
  
  before(:each) do
    @rak_result = RakResult.new(@result)
  end
  
  describe " #initialize" do
    it "should store the given rak output string" do
      RakResult.new('a_result').rak_output.should == 'a_result'
    end
    
    it "should strip leading and trailing whitespace" do
      @rak_result.rak_output.should == @result.strip
    end
  end
  
  describe " #file_names" do
    it "should return an array of files that were matched" do
      @rak_result.file_names.should == ['lib/janitor.rb', 'lib/finder.rb']
    end
  end
  
  describe " #hits" do
    it "should return an array of RakHits objects" do
      @rak_result.hits.first.should be_instance_of(RakHit)
    end
  end
end
