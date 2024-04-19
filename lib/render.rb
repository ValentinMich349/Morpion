require 'colorize'

class Render
  attr_accessor :grid

  def initialize
    @grid = []
  end

  def grid_display(int)
    case @grid[int].value
    when (1..9)
      ' '
    when 'X'
      @grid[int].value.colorize(:red)
    when 'O'
      @grid[int].value.colorize(:light_blue)
    end
  end

  def render_board(grid)
    @grid = grid
    puts '      A      B     C   '
    puts '          |     |     '
    puts "       #{grid_display(0)}  |  #{grid_display(1)}  |  #{grid_display(2)}  "
    puts '     _____|_____|_____'
    puts '          |     |     '
    puts "       #{grid_display(3)}  |  #{grid_display(4)}  |  #{grid_display(5)}  "
    puts '     _____|_____|_____'
    puts '          |     |     '
    puts "       #{grid_display(6)}  |  #{grid_display(7)}  |  #{grid_display(8)}  "
    puts '          |     |     '
    puts "\n\n"
  end
end
