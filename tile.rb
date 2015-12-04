require_relative "board.rb"

class Tile

  attr_reader :board, :pos
  attr_accessor :has_flag, :revealed, :has_bomb

  def initialize(board, pos)
    @has_bomb = false
    @has_flag = false
    @revealed = false
    @board = board
    @pos = pos
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
