require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../game'
require_relative '../player'
require_relative '../dice'
require_relative '../track'
require_relative '../ladder.rb'
require_relative '../snake.rb'

class TestGame < Minitest::Test

def setup()
  @player_1 = Player.new("Steve")
  @player_2 = Player.new("Ally")
  players = [@player_1, @player_2]
  @game = Game.new(players)
  @game.create_ladders()
  @game.create_snakes()
  @game_die = Dice.new()
end

def test_create_game()
  assert_equal(true, @game.is_a?(Game))
  assert_equal(true, @game.track() != nil)
  assert_equal(2, @game.get_num_players())
  assert_includes(0..30, @game.get_num_ladders())
end

# Should really have a test to ensure that first player selection is random

def test_init_game()
  # Test Game has Track
  assert_equal(true, @game.track().is_a?(Track))
  # Test Game has 2 players
  assert_equal(2, @game.get_num_players())
  # Test game has 1 die
  assert_equal(true, @game.dice().is_a?(Dice))
  # Test game has selected first player to play
  assert_equal(true, @game.first_player().is_a?(Player))
  # Test game has current player
  assert_equal(true, @game.current_player().is_a?(Player))
end

def test_take_turn()
  @game.take_turn()
  # Set last_player to index of current_player - 1
  last_player = @game.players()[@game.players().index(@game.current_player()) - 1]
  # Test that player who just played has moved between 1 and 6 tiles
  assert_includes(1..6, last_player.current_position())
  # Test that current_player has updated
  assert_equal(true, last_player != @game.current_player())
  # Test whether win condition has been properly assessed
  assert_equal(true, (last_player.current_position() < 99 && last_player.has_won() == false))
end

def test_win()
  # Set current_player position to 98, i.e. any move will win game
  @game.current_player().set_current_position(98)
  # Get dice roll
  moves = @game_die.roll()
  # current_player makes a move and should win game
  @game.current_player().make_move(moves)

  assert_equal(true, @game.current_player().has_won())
end

def test_ladders()
  assert_includes(1..30, @game.get_num_ladders())
end

def test_snakes()
  assert_includes(1..30, @game.get_num_snakes())
end



end