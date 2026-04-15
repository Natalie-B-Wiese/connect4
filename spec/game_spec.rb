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
  end
end
