# frozen_string_literal: true

require_relative 'board'

# a class for gameplay
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
  end
end
