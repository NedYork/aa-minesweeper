require_relative "board.rb"
require_relative "tile.rb"

class Minesweeper

  attr_accessor :game
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
          el_output = el.has_flag ? "F" : "*"
        end
        row_output << el_output
      end
      p row_output.join(" ")
    end
  end

  # Prompt user for position
  # Assumes user inputs correct format
  def prompt
    puts "Select a position e.g. 0, 0"
    position = gets.chomp.split(", ").map {|i| i.to_i }
    puts "Would you like to reveal or toggle flag? e.g. R or F"
    action = gets.chomp.upcase
    [position, action]
  end

  def update_pos
    position, action = prompt
    x, y = position
    case action
    when "R"
      game.grid[x][y].revealed = true
    when "F"
      game.grid[x][y].has_flag = !game.grid[x][y].has_flag
    end
  end

end

# update position @revealed to true
# render board
# When rendering that new position,
# Determine whether it has a bomb, if so display correct char
# If it doesn't have a bomb,
# find its neighbors and ask them if they have bombs
# calculate the total number of bombs
# display that total number
