require "minitest/autorun"
require "minitest//reporters"
Minitest::Reporters.use!
require "pry"
require"./game"

class GameTest < Minitest::Test

  def test_game_is_a_thing
    assert Game.is_a?(Class)
  end

  def test_can_you_escape_noose
    g = Game.new
    refute g.out_of_guesses?
    assert_equal 9, g.guesses_left
  end


  def test_can_you_hang
        g = Game.new answer: "monkey"
        9.times do
          g.check_guess "t"
        end
        assert g.over?
        assert_equal 0, g.guesses_left
      end



  def test_can_you_guess_correctly
    g = Game.new answer: "monkey"
   g.check_guess "m"
   result="m"
   assert_equal "m", result

  end

  def test_can_you_escape_death
    g = Game.new answer:"monkey"
    "monkey".split("").each {|letter| g.check_guess letter}
    assert_equal true, g.over?

  end

end
