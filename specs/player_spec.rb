require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../player'

class TestPlayer < Minitest::Test

def setup()
  @player = Player.new("Steve")
end

def test_create_player()
  assert_equal(true, @player.is_a?(Player))
  assert_equal(false, @player.has_won())
  assert_equal(0, @player.current_position())
end

end