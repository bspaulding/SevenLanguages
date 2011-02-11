# Print the contents of an array of sixteen numbers, four numbers at 
# a time, using just each.
# Now, do the same with each_slice in Enumerable.
x = []
16.times { |number| x << number }

puts 'Using only Array#each()'
# Is there anyway to do this without using an external temporary variable?
numbers = []
x.each do |number|
  numbers << number
  if (numbers.length == 4) || ((x.index(number) + 1) == x.length)
    puts numbers.join(':') 
    numbers.clear
  end
end

puts 'Using Enumerable#each_slice()'
x.each_slice(4) { |numbers| puts numbers.join(', ') }
