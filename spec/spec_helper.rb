$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'spec'
require 'spec/autorun'

# Require each of our libraries
Dir.glob(File.join(File.dirname(__FILE__), '../lib/*.rb')).each {|f| require f }

Spec::Runner.configure do |config|
  
end
