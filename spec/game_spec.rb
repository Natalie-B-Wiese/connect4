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
    end

    context 'when getting the last column' do
      last_column = 6

      it 'returns an array' do
        result = board.column(last_column)
        expect(result).to be_an(Array)
      end

      it 'returns an array of length equal to board height' do
        result = board.row(last_column)
        height = Board::HEIGHT
        expect(result.length).to eq(height)
      end
    end
  end
end
