require_relative '../lib/board'
require_relative '../lib/chip'
require_relative '../lib/player'

describe Board do
  subject(:board) { described_class.new }

  describe '#row' do
    context 'when getting the first row' do
      first_row = 0

      it 'returns an array' do
        result = board.row(first_row)
        expect(result).to be_an(Array)
      end

      it 'all items are nil on new board' do
        result = board.row(first_row)
        expect(result).to all(be_nil)
      end

      it 'returns an array of length equal to board width' do
        result = board.row(first_row)
        width = Board::WIDTH
        expect(result.length).to eq(width)
      end
    end

    context 'when getting the last row' do
      last_row = 5

      it 'returns an array' do
        result = board.row(last_row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length equal to board width' do
        result = board.row(last_row)
        width = Board::WIDTH
        expect(result.length).to eq(width)
      end

      it 'all items are nil on new board' do
        result = board.row(last_row)
        expect(result).to all(be_nil)
      end
    end
  end

  describe '#all_rows' do
    context 'when calling method' do
      it 'returns an array' do
        result = board.all_rows
        expect(result).to be_an(Array)
      end

      it 'it is a 2D array' do
        result = board.all_rows
        expect(result).to all(be_an(Array))
      end

      it 'there are a total of Board::HEIGHT rows' do
        result = board.all_rows
        width = Board::HEIGHT
        expect(result.length).to eq(width)
      end
    end
  end

  describe '#column' do
    context 'when getting the first column' do
      first_column = 0

      it 'returns an array' do
        result = board.column(first_column)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length equal to board height' do
        result = board.column(first_column)
        height = Board::HEIGHT
        expect(result.length).to eq(height)
      end

      it 'all items are nil on new board' do
        result = board.column(first_column)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting the last column' do
      last_column = 6

      it 'returns an array' do
        result = board.column(last_column)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length equal to board height' do
        result = board.column(last_column)
        height = Board::HEIGHT
        expect(result.length).to eq(height)
      end

      it 'all items are nil on new board' do
        result = board.column(last_column)
        expect(result).to all(be_nil)
      end
    end
  end

  describe '#all_columns' do
    context 'when calling method' do
      it 'returns an array' do
        result = board.all_columns
        expect(result).to be_an(Array)
      end

      it 'it is a 2D array' do
        result = board.all_columns
        expect(result).to all(be_an(Array))
      end

      it 'it has a length of Board::WIDTH' do
        result = board.all_columns
        width = Board::WIDTH
        expect(result.length).to eq(width)
      end
    end
  end

  describe '#positive_diagonal' do
    context 'when getting bottom left' do
      row = 0
      column = 0

      it 'returns an array' do
        result = board.positive_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 6' do
        result = board.positive_diagonal(column, row)
        expect(result.length).to eq 6
      end

      it 'all items are nil on new board' do
        result = board.positive_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting column 0 row 2' do
      row = 2
      column = 0

      it 'returns an array' do
        result = board.positive_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 4' do
        result = board.positive_diagonal(column, row)
        expect(result.length).to eq 4
      end

      it 'all items are nil on new board' do
        result = board.positive_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting column 4 row 0' do
      row = 0
      column = 4

      it 'returns an array' do
        result = board.positive_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 3' do
        result = board.positive_diagonal(column, row)
        expect(result.length).to eq 3
      end

      it 'all items are nil on new board' do
        result = board.positive_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting top left' do
      row = 5
      column = 0

      it 'returns an array' do
        result = board.positive_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 1' do
        result = board.positive_diagonal(column, row)
        expect(result.length).to eq 1
      end

      it 'all items are nil on new board' do
        result = board.positive_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end
  end

  describe '#negative_diagonal' do
    context 'when getting top left' do
      row = 5
      column = 0

      it 'returns an array' do
        result = board.negative_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 6' do
        result = board.negative_diagonal(column, row)
        expect(result.length).to eq 6
      end

      it 'all items are nil on new board' do
        result = board.negative_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting column 0 row 2' do
      row = 2
      column = 0

      it 'returns an array' do
        result = board.negative_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 3' do
        result = board.negative_diagonal(column, row)
        expect(result.length).to eq 3
      end

      it 'all items are nil on new board' do
        result = board.negative_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting column 4 top row' do
      row = 5
      column = 4

      it 'returns an array' do
        result = board.negative_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 3' do
        result = board.negative_diagonal(column, row)
        expect(result.length).to eq 3
      end

      it 'all items are nil on new board' do
        result = board.negative_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end

    context 'when getting bottom left' do
      row = 0
      column = 0

      it 'returns an array' do
        result = board.negative_diagonal(column, row)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length 1' do
        result = board.negative_diagonal(column, row)
        expect(result.length).to eq 1
      end

      it 'all items are nil on new board' do
        result = board.negative_diagonal(column, row)
        expect(result).to all(be_nil)
      end
    end
  end

  describe '#all_diagonals' do
    context 'when calling method' do
      it 'returns an array' do
        result = board.all_diagonals
        expect(result).to be_an(Array)
      end

      it 'has a length of 12' do
        result = board.all_diagonals
        expect(result.length).to eq 12
      end

      matcher :contain_at_least_4_items do
        match { |element| element.length >= 4 }
      end

      it 'All elements have at least 4 items' do
        result = board.all_diagonals
        expect(result).to all(contain_at_least_4_items)
      end
    end
  end

  describe '#all_runs' do
    context 'when calling method' do
      it 'returns an array' do
        result = board.all_runs
        expect(result).to be_an(Array)
      end

      it 'it is a 2D array' do
        result = board.all_runs
        expect(result).to all(be_an(Array))
      end

      it 'its length is a combination of all_rows all_columns and all_diagonals' do
        result = board.all_runs
        desired_length = board.all_rows.length + board.all_columns.length + board.all_diagonals.length
        expect(result.length).to eq(desired_length)
      end
    end
  end

  describe '#board_full?' do
    context 'when board is empty' do
      it 'returns false' do
        allow(board).to receive(:column_full?).and_return(false)
        expect(board.board_full?).to be false
      end
    end

    context 'when only first column is full' do
      it 'returns false' do
        allow(board).to receive(:column_full?).and_return(true, false)
        expect(board.board_full?).to be false
      end
    end

    context 'when 6 columns are full but 7th column is empty' do
      it 'returns false' do
        allow(board).to receive(:column_full?).and_return(true, true, true, true, true, true, false)
        expect(board.board_full?).to be false
      end
    end

    context 'when all columns are full' do
      it 'returns true' do
        allow(board).to receive(:column_full?).and_return(true)
        expect(board.board_full?).to be true
      end
    end
  end

  describe '#place_player_in_column and #get_new_chip_position_in_column' do
    context 'in the first column of an empty game' do
      let(:player1) { Player.new('Player 1') }
      subject(:my_game) { described_class.new }
      column = 0

      it 'creates a chip from player' do
        allow(my_game).to receive(:get_new_chip_position_in_column).and_return(0)
        expect(Chip).to receive(:new).with(player1)
        my_game.place_player_in_column(player1, column)
      end

      it 'calls #get_new_chip_position_in_column to get chip placement' do
        allow(my_game).to receive(:get_new_chip_position_in_column).and_return(0)
        expect(my_game).to receive(:get_new_chip_position_in_column).with(column)
        my_game.place_player_in_column(player1, column)
      end

      it 'places the chip in the correct position' do
        expect { my_game.place_player_in_column(player1, column) }.to change {
          my_game.get_new_chip_position_in_column(column)
        }.by(1)
      end

      it 'can place 3 chips in column' do
        chip_start_index = my_game.get_new_chip_position_in_column(column)
        my_game.place_player_in_column(player1, column)
        my_game.place_player_in_column(player1, column)
        my_game.place_player_in_column(player1, column)
        chip_end_index = my_game.get_new_chip_position_in_column(column)

        expect(chip_end_index - chip_start_index).to eq(3)
      end
    end

    context 'in the fourth column of an empty game' do
      let(:player1) { Player.new('Player 1') }
      subject(:my_game) { described_class.new }
      column = 3

      it 'creates a chip from player' do
        allow(my_game).to receive(:get_new_chip_position_in_column).and_return(0)
        expect(Chip).to receive(:new).with(player1)
        my_game.place_player_in_column(player1, column)
      end

      it 'calls #get_new_chip_position_in_column to get chip placement' do
        allow(my_game).to receive(:get_new_chip_position_in_column).and_return(0)
        expect(my_game).to receive(:get_new_chip_position_in_column).with(column)
        my_game.place_player_in_column(player1, column)
      end

      it 'places the chip in the correct position' do
        expect { my_game.place_player_in_column(player1, column) }.to change {
          my_game.get_new_chip_position_in_column(column)
        }.by(1)
      end

      it 'can place 3 chips in column' do
        chip_start_index = my_game.get_new_chip_position_in_column(column)
        my_game.place_player_in_column(player1, column)
        my_game.place_player_in_column(player1, column)
        my_game.place_player_in_column(player1, column)
        chip_end_index = my_game.get_new_chip_position_in_column(column)

        expect(chip_end_index - chip_start_index).to eq(3)
      end
    end
  end
end
