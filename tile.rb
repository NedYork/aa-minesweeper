require_relative "board.rb"

class Tile

  attr_reader :has_bomb, :board
  attr_accessor :has_flag, :revealed

  def initialize(board)
    @has_bomb = false
    @has_flag = false
    @revealed = false
    @board = board
  end

  def reveal
    self.revealed = true
  end

  def neighbors
    #receive Board to determine its neighbors
    #You'll want to pass the Board to the Tile on
    #initialize so the Tile instance can use it to find its neighbors.
    #return array of neighbor Tile objects
  end

  def neighbor_bomb_count

  end

end
