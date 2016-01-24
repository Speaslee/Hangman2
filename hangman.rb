require 'pry'

class Game
  def initialize
    @word = ["bar", "dog", "monkey", "chips", "parrot" ].sample
    @word_array= @word.chars.to_a
    @guesses_left = 9
    @correct_guesses= []

  end

def print_board letter
  @word_array.each do |letter|
    if @correct_guesses.include? letter
      print letter
    else
      print "_"
    end
  end

  word= @correct_guesses.sort.join("")
  correct_letters=@word_array.uniq.sort.join("")
  if word == correct_letters
    @correct_answer=true
  end

end

  def guesses_left
    @guesses_left
  end

  def character_count
    @word.length
  end

  def check_guess letter

    guess=  @word.count letter
    puts "There are #{guess} #{letter}'s in the word. "
      if guess == 0
        @guesses_left= @guesses_left -1
      else puts "Good job."
        @guesses_left
      end
      if @word.include? letter
        @correct= true
        @correct_guesses.push (letter)
      end

    end

    def won?
    @correct_answer
    end

  def over?
   @correct_answer || @guesses_left == 0
  end

end

g=Game.new
puts "Guess the word. It has #{g.character_count} characters."


until g.over?
  puts"
  you have #{g.guesses_left} tries left"
  puts "Ok, pick a letter."
    letter = gets.chomp

    g.check_guess letter
    g.print_board letter

end


if g.won?
  puts "
  You win
  (ง ͠° ͟ل͜ ͡°)ง"
else
  puts "
  You lost
  ¯|_(ツ)_/¯"
end
