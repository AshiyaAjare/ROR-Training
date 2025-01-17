=begin

initialize_word function: displays the information about the random word that is to be guessed by the user.
It displays: 
  - number of vowels and their positions
  - number of consonants and their positions
  - visualisation by underscores of the word to be guessed
  - Length of that random word

=end

def initialize_word(words, word, guess_word)
  vowels = 0
  consonants = 0
  vowel_positions = []
  consonant_positions = []

  word.each_char.with_index(1) do |char, index|
    if char =~ /[aeiou]/i
      vowels += 1
      vowel_positions << index
    elsif char =~ /[a-z]/i
      consonants += 1
      consonant_positions << index
    end
  end
  
  puts guess_word
  puts "Length of the word: #{word.length}"
  puts "Total vowels: #{vowels}, Positions: #{vowel_positions.join(', ')}"
  puts "Total consonants: #{consonants}, Positions: #{consonant_positions.join(', ')}"
end


def make_guesses(word, guess_word)
  chances = 10

  while chances>0 && guess_word.include?("_")
    puts"**************************************"
    puts "Current word: #{guess_word}"
    puts "You have #{chances} chances left"

    puts "**************************************"

    print "Enter a character: "
    char = gets.chomp.downcase

    if word.include?(char)
      word_arr = word.chars # converts string to an array of characters
      word_arr.each_with_index do |c,i|
        if c==char
          guess_word[i*2]=char
        end
      end
      puts "**************************************"
      puts "Correct guess!"
    else
      chances-=1
  puts "Wrong guess!"
    end
    puts "**************************************"
  end

  if guess_word.include?("_")
  puts "Sorry, you lost the game"
    puts "The word was #{word}."
  else
    puts "Congratulations, you won!"
  end
  puts "**************************************"
end



def play_hangman(words)
  word = words.sample.downcase
  guess_word = ""
  len = word.length - 1
  for i in 0..len
    if word[i]!= " "
      guess_word+="_ "
    else
      guess_word+="  "
    end
  end

  initialize_word(words, word, guess_word)
  make_guesses(word, guess_word)

end


def main_menu
  puts "------HANGMAN------"
  puts "Choose a difficulty level"
  puts "-------------------"
  puts "1. Level 1 - Beginner"
  puts "2. Level 2 - Basic"
  puts "3. Level 3 - Intermediate"
  puts "4. Level 4 - Advanced"
  puts "5. Level 5 - Expert"
  puts "-------------------"
  puts "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Level 1 Hint - colors"
    words = ['blue', 'yellow', 'green', 'orange', 'pink', 'teal', 'black', 'brown', 'white', 'grey']
    play_hangman(words)
  when 2
    puts "Level 2 hint - fruits"
    words = ['apple', 'banana', 'orange', 'cherry', 'papaya', 'coconut', 'watermelon', 'grapes', 'guava', 'blueberry']
    play_hangman(words)
  when 3
    puts "Level 3 hint - restaurant dishes"
    words = ['burger', 'cheesecake', 'pizza', 'wraps', 'pasta', 'tiramisu', 'chocolate', 'tacos', 'salad', 'sushi']
    play_hangman(words)
  when 4
    puts "Level 4 hint - movie names (Hindi or English, both)"
    words = ['Chennai Express', 'Titanic', 'Stuart Little', 'Bhool Bhulaiyaa', 'Garfield', 'Dear Zindagi', 'Avengers']
    play_hangman(words)
  when 5
    puts "Level 5 hint - Movie or Book Character names"
    words = ['Harry Potter', 'Black Widow', 'Naruto', 'Bucky Barnes', 'Ron Weasley', 'Hermione Granger', 'Peter Parker']
    play_hangman(words)
 end
 end 

 main_menu
