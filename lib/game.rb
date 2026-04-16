# frozen_string_literal: true

require_relative 'board'

# a class for gameplay
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @round = 0
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

  # returns a valid column number in the correct range
  def valid_column_number
    loop do
      column_index = column_prompt
      return column_index unless column_index.nil?

      puts 'Input error!'
    end
  end

  # returns a valid column number in correct range that can still hold another chip
  def valid_unfull_column_number
    loop do
      column_id = valid_column_number
      column_full = @board.column_full?(column_id)
      return unless column_full

      puts 'Column is full!'
    end
  end

  def next_round
    @round += 1
  end

  def current_player
    if @round.odd?
      @player1
    else
      @player2
    end
  end

  ### UNTESTED FUNCTIONS
  # plays a single round
  def play_round
    puts "Round #{@round}"

    player = current_player

    puts "Player #{player} turn"

    column = valid_unfull_column_number

    @board.place_player_in_column(player, column)
  end

  private

  def column_prompt
    puts "Enter a column from 1 to #{Board::WIDTH}"
    string_input = gets.chomp
    to_column_number(string_input)
  end
end
