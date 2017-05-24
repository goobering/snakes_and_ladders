require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../dice'

class TestDice < Minitest::Test

def setup()
  @game_die = Dice.new()
end

def test_create_dice()
  assert_equal(true, @game_die.is_a?(Dice))
  assert_equal(6, @game_die.sides())
end

def test_roll_dice()
  assert_includes(1..6, @game_die.roll())
end

end