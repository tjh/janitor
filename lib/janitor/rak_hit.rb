# -----------------------------------------
# This represents a single search hit from
# the Rak gem. The raw output looks like:
#
#   lib/file_name.rb     10|require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
#
# This is a file name, then line number, followed by
# a pipe, then finally the context within that file
# -----------------------------------------

class RakHit
  attr_accessor :file_name, :line_number, :context
  
  def initialize(raw_hit)
    self.file_name, self.line_number, self.context = raw_hit.scan(/(.+?)\s*(\d+)\|\s*(.+)/).first
  end
end
