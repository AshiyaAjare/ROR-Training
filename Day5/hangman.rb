# frozen_string_literal: true

class Game_parameters
  def initialize
    @vowels = 0
    @consonants = 0
    @vowel_positions = []
    @consonant_positions = []
  end

  def set_parameters(word, guess_word)
    word.each_char.with_index(1) do |char, index|
      if char =~ /[aeiou]/i
        @vowels += 1
        @vowel_positions << index
      elsif char =~ /[a-z]/i
        @consonants += 1
        @consonant_positions << index
      end
    end

    puts guess_word
    puts "Length of the word: #{word.length}"
    puts "Total vowels: #{@vowels}, Positions: #{@vowel_positions.join(', ')}"
    puts "Total consonants: #{@consonants}, Positions: #{@consonant_positions.join(', ')}"
  end
end

class Hangman
  def initialize
    @chances = 10
  end

  def play_hangman(words, guess_word)
    word = words.sample.downcase
    len = word.length - 1

    (0..len).each do |i|
      guess_word += if word[i] != ' '
                      '_ '
                    else
                      '  '
                    end
    end

    sp = Game_parameters.new
    sp.set_parameters(word, guess_word)
    make_guess(word, guess_word)
  end

  def make_guess(word, guess_word)
    while @chances.positive? && guess_word.include?('_')
      puts '---------------------------------------------------'
      puts "Current Word: #{guess_word}"
      puts "Remaining chances: #{@chances}"
      puts '---------------------------------------------------'
      puts "\nEnter a character to guess: "
      char = gets.chomp.downcase

      if word.include?(char)
        word_arr = word.chars # Converts string to an array of characters
        word_arr.each_with_index do |c, i|
          guess_word[i * 2] = char if c == char
        end
        puts "\nCorrect guess!"
      else
        @chances -= 1
        puts 'Wrong guess!'
        "\n"
      end
    end

    if guess_word.include?('_')
      puts 'Sorry, you lost the game'
      puts "The word was #{word}."
      "\n"
    else
      puts 'Congratulations, you won!'
      puts "\n"
    end
  end
end

def main_menu
  # guess_word = ""
  hangman = Hangman.new

  loop do
    guess_word = ''

    puts "\n"
    puts '------HANGMAN------'
    puts 'Choose a difficulty level'
    puts '-------------------'
    puts '1. Level 1 - Beginner'
    puts '2. Level 2 - Basic'
    puts '3. Level 3 - Intermediate'
    puts '4. Level 4 - Advanced'
    puts '5. Level 5 - Expert'
    puts '0. EXIT'
    puts '-------------------'
    print 'Enter your choice: '
    choice = gets.chomp.to_i
    break if choice.zero?

    # guess_word = ""
    case choice
    when 1
      puts 'Level 1 Hint - Colors'
      words = %w[blue yellow green orange pink teal black brown white grey]
      hangman.play_hangman(words, guess_word)
    when 2
      puts 'Level 2 Hint - Fruits'
      words = %w[apple banana orange cherry papaya coconut watermelon grapes guava blueberry]
      hangman.play_hangman(words, guess_word)
    when 3
      puts 'Level 3 Hint - Restaurant Dishes'
      words = %w[burger cheesecake pizza wraps pasta tiramisu chocolate tacos salad sushi]
      hangman.play_hangman(words, guess_word)
    when 4
      puts 'Level 4 Hint - Movie Names (Hindi or English)'
      words = ['Chennai Express', 'Titanic', 'Stuart Little', 'Bhool Bhulaiyaa', 'Garfield', 'Dear Zindagi', 'Avengers']
      hangman.play_hangman(words, guess_word)
    when 5
      puts 'Level 5 Hint - Movie or Book Character Names'
      words = ['Harry Potter', 'Black Widow', 'Naruto', 'Bucky Barnes', 'Ron Weasley', 'Hermione Granger',
               'Peter Parker']
      hangman.play_hangman(words, guess_word)
    end
  end
end

main_menu
