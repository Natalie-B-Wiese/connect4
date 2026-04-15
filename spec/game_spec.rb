require_relative '../lib/board'

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
end
