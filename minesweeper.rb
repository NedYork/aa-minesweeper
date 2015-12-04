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
    game_over = false
    game.grid.each do |row|
      row_output = []
      row.each do |el|
        if el.revealed
          if el.has_bomb
            el_output = "X"
            game_over = true
          else
            el_output = "_"
            el.total_num_neighbor_bombs
            #has to be changed
            #find positions of neighbors
            #ask each neighbor if has bomb
            #count total number of bombs
            #output that integer instead of flag, star, or _




          end
        else
          el_output = el.has_flag ? "F" : "*"
        end
        row_output << el_output
      end
      p row_output.join(" ")
    end
    # call game_over method if game_over == true
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

  # update position @revealed to true for @has_flag to opposite value
  # render board
  def update_pos
    position, action = prompt
    x, y = position
    case action
    when "R"
      game.grid[x][y].revealed = true


    when "F"
      game.grid[x][y].has_flag = !game.grid[x][y].has_flag unless game.grid[x][y].revealed
    end
  end

end

# When rendering that new position,
# Determine whether it has a bomb, if so display correct char


# If it doesn't have a bomb,
# find its neighbors and ask them if they have bombs
# calculate the total number of bombs
# display that total number
