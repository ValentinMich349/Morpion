require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player1, :player2, :board, :render

  def initialize(name1, name2)
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @board = Board.new
    @render = Render.new
    play
  end

  def check_if_win
    winning_combination = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ]
    winning_combination.each do |ary|
      winning_element_for_x = 0
      winning_element_for_o = 0
      ary.length.times do |index|
        case @board.grid[ary[index] - 1].value
        when 'X'
          winning_element_for_x += 1
          return [true, 'X'] if winning_element_for_x == 3
        when 'O'
          winning_element_for_o += 1
          return [true, 'O'] if winning_element_for_o == 3
        end
      end
    end
    [false, '']
  end

  def play
    while !check_if_win[0] && !check_if_draw
      puts "\nC'est au tour de #{@player1.name}, tu compte jouer a quel endroit (#{player1.symbol.colorize(:red)})?"
      play_by_turn(1)
      next unless !check_if_win[0] && !check_if_draw

      puts "\nC'est au tour de #{@player2.name}, tu compte jouer a quel endroit  (#{player2.symbol.colorize(:light_blue)})?"
      play_by_turn(2)
    end
    puts 'Fin du jeu'
    @render.render_board(@board.grid)
  end

  def play_by_turn(int)
    @render.render_board(@board.grid)
    desired_play = gets.to_i
    while legal_move?(desired_play) == false
      puts "\nAlors non tu ne peux pas ! Cette case est deja prise"
      @render.render_board(@board.grid)
      desired_play = gets.to_i
    end
    case int
    when 1
      @board.grid[desired_play - 1].write_X
    when 2
      @board.grid[desired_play - 1].write_O
    end
    puts "\n#{@player1.name} Remporte la victoire pour cette fois ci!" if check_if_win[1] == 'X'
    puts "\n#{@player2.name} Remporte la victoire pour cette fois ci!" if check_if_win[1] == 'O'
    puts "\nFini le match n'a trouvé aucun gagnant" if check_if_draw
  end

  def legal_move?(str)
    str = str.to_i
    (str >= 1 && str <= 9) && @board.grid[str - 1].value.is_a?(Integer) ? true : false
  end

  def check_if_draw
    !check_if_win[0] && @board.check_full? ? true : false
  end
end
