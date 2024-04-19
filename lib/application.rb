require_relative 'game'
require_relative 'player'
require 'colorize'

class Application
  attr_accessor :name1, :name2, :win_p1, :win_p2, :game_draw

  def initialize
    @name1 = ''
    @name2 = ''
    @win_p1 = 0
    @win_p2 = 0
    @game_draw = 0
    screen_clear
    starter
    game_loop
  end

  def screen_clear
    system('clear')
  end

  def starter
    puts "\n\nBienvenue sur le super jeu du Morpion!"
    puts
    puts
    puts "\nJoueur numéro 1, choisis ton pseudo tu jouera 'X'"
    @name1 = gets.chomp
    puts "\nJoueur numéro 2, choisis ton pseudo tu jouera 'O'"
    @name2 = gets.chomp
    puts "\nSuper, #{name1} tu vas donc affronter #{name2}"
    puts
    puts
    puts "Chacun votre tour vous allez placer #{'X'.colorize(:red)} pour le Joueur 1 et le Joueur 2 placera #{'O'.colorize(:light_blue)}."
  end

  def show_stats
    puts "\n#{@name1} à gagné #{win_p1} fois"
    puts "#{@name2} a gagné #{win_p2} fois"
    puts "Mais il y a eu également #{game_draw} match nul"
  end

  def keep_playing?
    puts "\nEncore une fois? (n,y)"
    acceptable_response = false
    while acceptable_response == false
      response = gets.chomp
      case response.downcase
      when 'y'
        puts "\nSuper! on rejoue!!!"
        return true
      else
        puts "\nAurevoir a bientot"
        return false
      end
    end
  end

  def game_loop
    wanna_play = true
    while wanna_play == true
      game = Game.new(@name1, @name2)
      @win_p1 += 1 if game.check_if_win[1] == 'X'
      @win_p2 += 1 if game.check_if_win[1] == 'O'
      @game_draw += 1 if game.check_if_draw == true
      show_stats
      wanna_play = keep_playing?
    end
  end
end
