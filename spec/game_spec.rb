require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  let(:player1) { Player.new('Player 1') }
  let(:player2) { Player.new('Player 2') }

  describe '#initialize' do
    context 'when creating a game' do
      it 'creates a board' do
        expect(Board).to receive(:new)
        described_class.new(player1, player2)
      end
    end
  end
end
