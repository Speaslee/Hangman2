require "./game"

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
  ¯|_(ツ)_/¯
  your word was #{g.word_chosen}"
end
