require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

my_game = Game.new(player1, player2)
my_game.game_loop
