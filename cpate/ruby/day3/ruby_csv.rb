# Modify the CSV application to support an _each_ method to return a CsvRow 
# object.  Use method_missing on that CsvRow to return the value for the 
# column for a given heading.
# 
# For example, for the file:
#
# one, two
# lions, tigers
#
# allow an API that works like this:
#
# csv = RubyCsv.new
# csv.each {|row| puts row.one}
#
# This should print 'lions'.
module ActsAsCsv
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods

    attr_accessor :headers, :csv_contents
    
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        row = row.chomp.split(', ')

        # we need access to the headers in the array;
        # (is there a better way to do this -  feels dirty)
        def row.headers=(headers)
          @headers = headers
        end
        row.headers = @headers

        def row.method_missing(m, *args, &block)
          column_index = @headers.index m.to_s
          super.method_missing(m, args, block) unless column_index
          self[column_index]
        end

        @csv_contents << row
      end
    end
    
    def initialize
      read 
    end

    def each(&block)
      @csv_contents.each { |line| block.call(line) }
    end
  end

end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |line| puts line.one }
