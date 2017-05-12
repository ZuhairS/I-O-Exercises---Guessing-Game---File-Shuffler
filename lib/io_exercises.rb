# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  rng = Random.new
  guesses = []
  random_num = rng.rand(1..100)
  puts "Thank you for playing the Guessing Game"
  loop do
    print "\nPlease guess a number ranging from 1 to 100: "
    guess = gets.chomp.to_i
    guesses << guess
    if guess == random_num
      break
    elsif guess > random_num
      puts "\nYour guess: #{guess} is too high."
    elsif guess < random_num
      puts "\nYour guess: #{guess} is too low."
    end
    puts "Your guesses so far: #{guesses.join(', ')}"
  end
  puts "\nCongrats! You guessed the right number: #{guesses.last}"
  puts "Your guesses: #{guesses.join(', ')}"
  puts "You guessed a total of #{guesses.length} times."
end

def file_shuffler
  print "Please enter the name of the file you want shuffled: "
  file_name = gets.chomp
  shuffled_file_array = File.readlines("#{file_name}.txt").shuffle
  File.open("#{file_name}-shuffled.txt", "w") do |f|
    shuffled_file_array.each { |line| f.puts line }
  end
end

if __FILE__ == $PROGRAM_NAME
  # guessing_game
  # file_shuffler
end
