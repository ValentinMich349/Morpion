class BoardCase
  attr_accessor :value

  def initialize
    @value = nil
  end

  def write_X
    @value = 'X'
  end

  def write_O
    @value = 'O'
  end
end
