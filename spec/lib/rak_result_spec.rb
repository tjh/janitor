require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "RakResult" do
  before(:all) do
      @result = "
lib/janitor.rb
   1|require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
   9|end

lib/finder.rb
   7|Dir.glob(File.join(File.dirname(__FILE__), '../lib/*.rb')).each {|f| require f }
   9|Spec::Runner.configure do |config|
  11|end
"
  end
  
  describe " #initialize" do
    it "should store the given rak output string" do
      RakResult.new('a_result').rak_output.should == 'a_result'
    end
  end
  
  describe " #file_matches" do
    it "should return an array of files that were matched" do
      RakResult.new(@result).files.should == ['lib/janitor.rb', 'lib/finder.rb']
    end
  end
end
