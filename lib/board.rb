# frozen_string_literal: true

class Board
  WIDTH = 7
  HEIGHT = 6

  def initialize
    @board = Array.new(WIDTH)

    (0..WIDTH).each do |column|
      @board[column] = []
      (0..HEIGHT).each do |row|
        @board[column][row] = nil
      end
    end
  end
end
