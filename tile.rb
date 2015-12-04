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
    # create array of all surrounding tiles including out of bounds
    # select only tiles that are in bounds
    # return array of inbound neighbor Tile objects
    current_pos_x, current_pos_y = self.pos
    neighbor_positions = [ [current_pos_x, current_pos_y + 1],
                           [current_pos_x + 1, current_pos_y + 1],
                           [current_pos_x + 1, current_pos_y],
                           [current_pos_x + 1, current_pos_y - 1],
                           [current_pos_x, current_pos_y - 1],
                           [current_pos_x - 1, current_pos_y - 1],
                           [current_pos_x - 1, current_pos_y],
                           [current_pos_x - 1, current_pos_y + 1] ]
    valid_neighbors = []
    neighbor_positions.each do |x, y|
      valid_neighbors << board.grid[x][y] if x.between?(0,board.size - 1) && y.between?(0,board.size - 1)
    end
    valid_neighbors
  end

  def neighbor_bomb_count
    bomb_count = 0
    # get me the neighbors of that position
    neighborhood = self.neighbors
    neighborhood.each { |el| bomb_count += 1 if el.has_bomb}
    bomb_count
  end

end
