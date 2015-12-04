require "byebug"
require_relative "tile.rb"

class Board

  TOTAL_BOMBS = 10

  attr_reader :size
  attr_accessor :grid

  def initialize(size = 9)
    @size = size
    # @grid = Array.new(size) { Array.new(size) { Tile.new } }
    @grid = Array.new(size) { Array.new(size) }
    populate
    set_random_bombs
  end

  def set_random_bombs
    bombs_planted = 0
    until bombs_planted == TOTAL_BOMBS
      current_tile = grid[rand(size)][rand(size)]
      unless current_tile.has_bomb
        current_tile.has_bomb = true
        bombs_planted += 1
      end
    end
  end



  def populate
    # Iterate through grid and create a new tile object in each
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |_, col_idx|
        pos = [row_idx, col_idx]
        grid[row_idx][col_idx] = Tile.new(self, pos)
      end
    end



  end

end
