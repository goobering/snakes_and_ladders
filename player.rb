class Player

def initialize(name)
  @name = name
  @has_won = false
  @current_position = 0
end

def name()
  return @name
end

def has_won()
  return @has_won
end

def current_position()
  return @current_position
end

def set_current_position(new_position)
  @current_position = new_position
  if(@current_position >= 99)
    @has_won = true
  end
end

def make_move(moves)
  set_current_position(@current_position += moves)
end

end