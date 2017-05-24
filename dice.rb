class Dice

def initialize()
  @sides = 6
end

def sides()
  return @sides
end

def roll()
  return rand(1..6)
end

end