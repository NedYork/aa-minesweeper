class Tile

  attr_reader :has_bomb
  attr_accessor :has_flag, :revealed

  def initialize
    @has_bomb = false
    @has_flag = false
    @revealed = false
  end

  

end
