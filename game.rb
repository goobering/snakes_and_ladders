class Game

def initialize(players)
  @players = players
  @track = Track.new()
  # Should randomize first player
  @first_player = @players.sample()
  @current_player = @first_player
  @dice = Dice.new()
  @ladders = []
  @snakes = []
end

def create_ladders()
  for i in 0..8
    ladder_start_points = ((i * 10 + 0)..(i * 10 + 9)).to_a().shuffle()
    for j in 0..rand(0..2)
      start_point = ladder_start_points.pop()
      min_offset = 10
      max_offset = 98 - (i * 10 + 9)
      offset = (min_offset..max_offset).to_a().shuffle().pop()

      @ladders.push(Ladder.new(start_point, offset))
    end
  end
  for ladder in @ladders
    puts ladder.start_point
    puts ladder.offset
  end
  
end

def create_snakes()
  for i in 1..9
    snake_start_points = ((i * 10 + 0)..(i * 10 + 9)).to_a().shuffle()
    for j in 0..rand(0..2)
      start_point = snake_start_points.pop()
      min_offset = 10
      max_offset = 98 - (i * 10 + 9)
      offset = (min_offset..max_offset).to_a().shuffle().pop().to_i()

      @snakes.push(Snake.new(start_point, offset * -1))
    end
  end

  for snake in @snakes
    puts snake.start_point
    puts snake.offset
  end
end

def dice()
  return @dice
end

def current_player()
  return @current_player
end

def first_player()
  return @first_player
end

def players()
  return @players
end

def track()
  return @track
end

def get_num_players()
  return @players.count()
end

def take_turn()
  moves = @dice.roll()
  @current_player.make_move(moves)
  if @current_player.has_won()
    puts "Winner!"
  else
    @current_player = @players[@players.find_index(@current_player) - 1]
  end
end

def get_num_ladders()
  return @ladders.count()
end

def get_num_snakes()
  return @snakes.count()
end

end