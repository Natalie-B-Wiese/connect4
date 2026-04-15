# frozen_string_literal: true

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

  def column(column_index)
    @board[column_index]
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
end
