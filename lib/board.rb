require_relative 'board_case'
require_relative 'render'

class Board
  attr_accessor :grid

  def initialize
    @grid = []
    (1..9).each do |i|
      board_case = BoardCase.new
      board_case.value = i
      @grid << board_case
    end
  end

  def check_full?
    @grid.none? { |board_case| board_case.value.is_a?(Integer) } ? true : false
  end
end
