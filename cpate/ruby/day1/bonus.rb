guess = -1
random_number = rand(10)

until (guess == random_number)
  extra_str = if (guess != -1)
                " [last guess was too #{(guess < random_number)?('low'):('high')}]"
              else
                ''
              end
  puts "Guess a number#{extra_str}:"
  guess = gets.chomp.to_i
end

puts 'Congratulations!'
