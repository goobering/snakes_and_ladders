require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../track'

class TestTrack < Minitest::Test

def setup()
  @track = Track.new()
end

def test_create_track()
  assert_equal(true, @track.is_a?(Track))
  assert_equal(100, @track.num_tiles())
  assert_equal(0, @track.start_position())
end

end