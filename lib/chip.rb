# frozen_string_literal: true

# a class for a single chip (board piece)
class Chip
  RED = "\e[41m"
  YELLOW = "\e[43m"
  CHIP_COLORS = [RED, YELLOW]

  def initialize(player)
    @player = player
  end

  def belongs_to_player?(player)
    @player == player
  end

  private

  def chip_color
    CHIP_COLORS[@player.id]
  end
end
