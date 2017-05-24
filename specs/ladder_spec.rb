require 'Minitest/autorun'
require 'Minitest/rg'

require '../ladder.rb'

class TestLadder < Minitest::Test

def setup()
  @ladder = Ladder.new(rand(15..50))
end

def test_create_ladder()
  assert_equal(true, @ladder.is_a?(Ladder))
  assert_includes(0..98, @ladder.offset())
end

end