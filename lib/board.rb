# frozen_string_literal: true

require_relative 'chip'

# a class for a board. A board cannot exist without a Game
class Board
  WIDTH = 7
  HEIGHT = 6

  def initialize
    @board = Array.new(WIDTH)

    (0...WIDTH).each do |column|
      @board[column] = []
      (0...HEIGHT).each do |row|
        @board[column][row] = nil
      end
    end
  end

  def row(row_index)
    row_array = []
    @board.each do |column|
      row_array.push(column[row_index])
    end

    row_array
  end

  def all_rows
    row_arr = []
    (0...HEIGHT).each do |row_index|
      row_arr[row_index] = row(row_index)
    end
    row_arr
  end

  def column(column_index)
    @board[column_index]
  end

  def all_columns
    column_arr = []
    (0...WIDTH).each do |column_index|
      column_arr[column_index] = column(column_index)
    end
    column_arr
  end

  def all_diagonals
    all_positive_diagonals + all_negative_diagonals
  end

  def all_positive_diagonals
    diagonal_arr = []

    # left edge (exclude corner)
    # loop works in upward direction
    (1..(HEIGHT - 4)).each do |current_row|
      diagonal_arr.push(positive_diagonal(0, current_row))
    end

    # bottom left corner
    diagonal_arr.push(positive_diagonal(0, 0))

    # bottom edge (exclude corner)
    # loop works in rightward direction
    (1..(WIDTH - 4)).each do |current_col|
      diagonal_arr.push(positive_diagonal(current_col, 0))
    end

    diagonal_arr
  end

  def all_negative_diagonals
    diagonal_arr = []

    # represents height as 0-based index
    top_row = HEIGHT - 1

    # left edge (exclude corner (top_row))
    # works in upward direction
    ((4 - 1)...top_row).each do |current_row|
      diagonal_arr.push(negative_diagonal(0, current_row))
    end

    # top left corner
    diagonal_arr.push(negative_diagonal(0, top_row))

    # top edge (exclude corner)
    # works in rightward direction
    (1..(WIDTH - 4)).each do |current_col|
      diagonal_arr.push(negative_diagonal(current_col, top_row))
    end

    diagonal_arr
  end

  # all places where it is possible to get 4 in a row
  def all_runs
    all_rows + all_columns + all_diagonals
  end

  # go from bottom left to top right
  # there should be no tiles to the bottom left of parameters column, row
  def positive_diagonal(column, row)
    diagonal_arr = []
    # repeat until tile is out of bounds
    while (column < WIDTH) && (row < HEIGHT)
      diagonal_arr.push(@board[column][row])
      column += 1
      row += 1
    end

    diagonal_arr
  end

  # go from top left to bottom right
  # there should be no tiles to the top left of parameters column, row
  def negative_diagonal(column, row)
    diagonal_arr = []
    # repeat until tile is out of bounds
    while (column < WIDTH) && (row >= 0)
      diagonal_arr.push(@board[column][row])
      column += 1
      row -= 1
    end

    diagonal_arr
  end

  # returns true if all columns are full, false otherwise
  def board_full?
    @board.each.with_index do |_, column_index|
      return false unless column_full?(column_index)
    end
    true
  end

  def place_player_in_column(player, column_index)
    chip_to_place = Chip.new(player)
    chip_position = get_new_chip_position_in_column(column_index)
    @board[column_index][chip_position] = chip_to_place
  end

  # returns the the first empty slot from the bottom in the specified column
  # returns nil if the column is full
  def get_new_chip_position_in_column(column_id)
    @board[column_id].index(nil)
  end

  def max_player_streak_in_run(player, run)
    biggest_run_by_player = 0
    current_run_by_player = 0
    run.each do |chip|
      # if the streak of this player is interruped by a nil chip or a chip that doesn't belong to this player
      if chip.nil? || chip.belongs_to_player?(player) == false
        current_run_by_player = 0
      else
        current_run_by_player += 1
      end

      biggest_run_by_player = current_run_by_player if current_run_by_player > biggest_run_by_player
    end

    biggest_run_by_player
  end

  # returns the maximum streak of the player in all the runs
  def max_player_streak(player)
    runs = all_runs
    max = 0

    runs.each do |run|
      streak = max_player_streak_in_run(player, run)
      max = streak if streak > max
    end
    max
  end

  ### UNTESTED METHODS ###
  # returns true if the column is full, false otherwise
  def column_full?(column_id)
    @board[column_id].include?(nil) == false
  end

  # returns true if the player has 4 in a row somewhere
  def player_won?(player)
    max_player_streak(player) >= 4
  end

  def draw_board
    puts 'board placeholder'

    # go in reverse column order so 0th column is at the bottom
    reversed_rows = all_rows.reverse

    reversed_rows.each do |row|
      row.each do |chip|
        if chip.nil?
          print "| #{Chip::CHIP_SYMBOL} |"
        else
          print "| #{chip} |"
        end
      end
      print "\n"
    end
  end
end
