require 'Minitest/autorun'
require 'Minitest/rg'

require '../snake.rb'

class TestSnake < Minitest::Test

def setup()
  @snake = Snake.new(rand(15..50))
end

def test_create_snake()
  assert_equal(true, @snake.is_a?(Snake))
  assert_includes(0..98, @snake.offset())
end

end