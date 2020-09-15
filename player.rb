class Player
  # The nouns the subject within the game (they are POWERLESS TO THE GAME)
  # they only have three lives predestinied by the game
  # the have a name (player1 and player2)
  # once the lives or score go down to 0 they become the loser
  # dead method
  attr_reader :name
  attr_accessor :life
  def initialize (name)
    @name = name
    @life = 3
  end

  def dead 
    @life <= 0
  end

  def dying
    @life -= 1
  end
end

