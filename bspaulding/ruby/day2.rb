#! /usr/bin/env ruby

def log(message)
  puts "\n#{message}\n--------------------"
end

# Ex. 1
log "Print the contents of an array of sixteen numbers, four numbers at a time, using just each."
slice = []
(1..16).each do |i|
  slice << i
  if slice.count == 4
    puts slice.join(', ')
    slice = []
  end
end

log "Now, do the same with each_slice in Enumerable."
(1..16).each_slice(4) {|slice| puts slice.join(', ') }

# Ex. 2
