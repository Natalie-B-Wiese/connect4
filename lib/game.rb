# frozen_string_literal: true

require_relative 'board'

# a class for gameplay
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
  end

  # if input-1 is a valid column index it returns a 0-based column number from input
  # Otherwise returns nil
  # NOTE: it does not check if the column is full
  def to_column_number(string_input)
    # if must be an integer digit of any length that doesn't begin with 0
    return nil unless string_input.match(/^[1-9]\d*$/)

    int_input = string_input.to_i

    # return the input if it is in a valid column rangge
    return int_input - 1 if int_input >= 1 && int_input <= Board::WIDTH

    nil
  end

  private

  ### UNTESTED FUNCTIONS
  def column_prompt
    puts "Enter a column from 1 to #{Board::WIDTH}"
    string_input = gets.chomp
    to_column_number(string_input)
  end
end
