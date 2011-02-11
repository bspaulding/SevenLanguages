#!/usr/bin/env ruby
# Write a simple grep that will print the lines of a file having any 
# occuences of a phrase anywhere in that line.  You will need to do 
# a simple regular expression match and read lines from a file.  (This 
# is surprisingly simple in Ruby.)  If you want, include line numbers.

unless ARGV[0]
  puts 'A file path is required.'
  exit 1
end

file_str = File.join File.expand_path('.'), ARGV[0]

unless File.exists?(file_str) && File.file?(file_str)
  puts "File [#{file_str}] does not exist or is not readable."
  exit 2
end

regexp_str = ARGV[1] || '.*'

File.open file_str, 'r' do |input|
  input.each { |line| puts "#{input.lineno}: #{line}" if line =~ %r{#{regexp_str}} }
end
