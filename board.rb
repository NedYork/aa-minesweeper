require "byebug"
require_relative "tile.rb"

class Board

  attr_reader :size
  attr_accessor :grid

  def initialize(size = 9)
    @size = size
    # @grid = Array.new(size) { Array.new(size) { Tile.new } }
    @grid = Array.new(size) { Array.new(size) }
  end



  def populate
    # Iterate through grid and create a new tile object in each
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |_, col_idx|
        pos = [row_idx, col_idx]
        grid[row_idx][col_idx] = Tile.new(self, pos)
      end
    end

    # (0...size).each do |row|
    #   (0...size).each do |col|
    #     pos = [row, col]
    #     # byebug
    #     self.grid[row][col] = Tile.new(self, pos)
    #   end
    # end



  end

end
