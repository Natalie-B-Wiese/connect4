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
    diagonal_arr = []

    # positive diagonal
    col = 0
    row = HEIGHT - 4

    # 0, 2
    # 0, 1
    # 0, 0
    while row >= 0
      diagonal_arr.push(positive_diagonal(col, row))
      row -= 1
    end

    # width is 7
    # while col<=3

    # 1, 0
    # 2, 0
    # 3, 0
    col = 1
    row = 0
    while col <= (WIDTH - 4)
      diagonal_arr.push(positive_diagonal(col, row))
      col += 1
    end

    # negative diagonals
    col = 0
    row = 4 - 1

    while row < HEIGHT
      diagonal_arr.push(negative_diagonal(col, row))
      row += 1
    end

    col = 1
    row = HEIGHT - 1
    while col <= (WIDTH - 4)
      diagonal_arr.push(negative_diagonal(col, row))
      col += 1
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
