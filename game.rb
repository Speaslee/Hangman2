require 'pry'


dictionary = File.read "/usr/share/dict/words"
Words = dictionary.split.uniq

class Game


  def initialize answer: nil
    @word = answer || Words.sample.downcase
    @word_array= @word.chars.to_a
    @guesses_left = 9
    @correct_guesses= []
  end

def out_of_guesses?
  @correct_guesses == 0
end

def print_board letter
  @word_array.each do |letter|
    if @correct_guesses.include? letter
      print letter
    else
      print "_"
    end
  end
@correct_guesses.each do |letter|
  word= @correct_guesses.sort.join("")
  correct_letters=@word_array.uniq.sort.join("")
  if word == correct_letters
    @correct_answer=true
  end
end
end

  def word_chosen
    @word
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
