#! /usr/bin/env ruby

def play_round
  puts "Guess a number between 1-10: "
  guess = gets.to_i

  answer = rand(10) + 1
  if guess == answer
    puts "That's my number! :)"
  else
    puts "Sorry, my number was #{answer}. :("
  end
end

def play_again?
  puts "Wanna play again? (y/n)"
  gets =~ /(y|Y)/
end

play_round
play_round while play_again?