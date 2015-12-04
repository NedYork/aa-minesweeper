require_relative "board.rb"
require_relative "tile.rb"

class Minesweeper

  attr_reader :game
  # When creating a new Minesweeper game, create a new board
  def initialize
    @game = Board.new
  end

  # iterate through the board and print out the corresponding symbol
  def render
    game.grid.each do |row|
      row_output = []
      row.each do |el|
        if el.revealed
          el_output = "_" #has to be changed
        else
          el_output = "*"
        end
        row_output << el_output
      end
      p row_output.join(" ")
    end
  end

end
