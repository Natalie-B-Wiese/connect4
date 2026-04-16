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

  describe '#to_column_number' do
    subject(:game_check) { described_class.new(player1, player2) }
    # NOTE: #to_column_number will only return a value if input-1 is a valid column index, otherwise nil

    context 'when given valid input' do
      it 'returns input minus 1' do
        user_input = '3'
        goal = 2
        result = game_check.to_column_number(user_input)
        expect(result).to eq(goal)
      end
    end

    context 'when given first column' do
      it 'returns 0' do
        user_input = '1'
        goal = 0
        result = game_check.to_column_number(user_input)
        expect(result).to eq(goal)
      end
    end

    context 'when given last column' do
      it 'returns WIDTH minus 1' do
        user_input = Board::WIDTH.to_s
        goal = user_input.to_i - 1
        result = game_check.to_column_number(user_input)
        expect(result).to eq(goal)
      end
    end

    context 'when given a column of 0' do
      it 'returns nil' do
        user_input = '0'
        result = game_check.to_column_number(user_input)
        expect(result).to be_nil
      end
    end

    context 'when given a negative column' do
      it 'returns nil' do
        user_input = '-100'
        result = game_check.to_column_number(user_input)
        expect(result).to be_nil
      end
    end

    context 'when given a column bigger than board width' do
      it 'returns nil' do
        user_input = (Board::WIDTH + 1).to_s
        result = game_check.to_column_number(user_input)
        expect(result).to be_nil
      end
    end

    context 'when given invalid input' do
      it 'returns nil' do
        user_input = '5b'
        result = game_check.to_column_number(user_input)
        expect(result).to be_nil
      end
    end

    context 'when given decimal' do
      it 'returns nil' do
        user_input = '1.24'
        result = game_check.to_column_number(user_input)
        expect(result).to be_nil
      end
    end
  end

  # a looping method that loops until user input is a valid column number
  describe '#valid_column_number' do
    subject(:game) { described_class.new(player1, player2) }
    error_msg = 'Input error!'
    valid_column_index = 1

    context 'when column is valid' do
      it 'runs once with no error message' do
        allow(game).to receive(:to_column_number).and_return(valid_column_index)

        expect(game).to receive(:to_column_number).exactly(1).times
        expect(game).not_to receive(:puts).with(error_msg)
        game.valid_column_number
      end
    end

    context 'when column is invalid and then valid' do
      it 'runs twice and prints one error message' do
        allow(game).to receive(:to_column_number).and_return(nil, valid_column_index)

        expect(game).to receive(:to_column_number).exactly(2).times
        expect(game).to receive(:puts).with(error_msg).exactly(1).times
        game.valid_column_number
      end
    end

    context 'when column is invalid twice, and then valid' do
      it 'runs 3 times and prints two error messages' do
        allow(game).to receive(:to_column_number).and_return(nil, nil, valid_column_index)

        expect(game).to receive(:to_column_number).exactly(3).times
        expect(game).to receive(:puts).with(error_msg).exactly(2).times
        game.valid_column_number
      end
    end
  end
end
