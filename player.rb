class Player
  attr_accessor :lives
  attr_reader :initial_lives
  
  def initialize(lives)
    @lives = lives
    @initial_lives = lives
  end
end