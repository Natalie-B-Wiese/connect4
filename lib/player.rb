# frozen_string_literal: true

# a basic data structure that represents a player
class Player
  @@player_count = 0
  attr_reader(:id)

  def initialize(name)
    @id = @@player_count
    @name = name
    @@player_count += 1
  end

  def to_s
    @name
  end
end
