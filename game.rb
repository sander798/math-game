require "./player.rb"

class Game
  def initialize
    run_game
  end

  def run_game
    turn = 1

    player_1 = Player.new(3)
    player_2 = Player.new(3)

    while player_1.lives > 0 && player_2.lives > 0
      puts "***** NEW TURN *****"
      
      # Ask new question
      question = get_question
      puts "Player #{turn}: #{question[:text]}"

      # Get player answer
      player_answer = gets.chomp

      if player_answer == question[:answer].to_s
        puts "Correct!"
      else
        player_1.lives = player_1.lives - 1 if turn == 1
        player_2.lives = player_2.lives - 1 if turn == 2

        puts "Nope!"
      end

      # Score
      puts "Lives: P1: #{player_1.lives}/#{player_1.initial_lives} | P2: #{player_2.lives}/#{player_2.initial_lives}"

      turn = turn + 1
      turn = 1 if turn == 3
    end

    # Game results
    if player_1.lives > 0
      puts "Player 1 wins! -> Score: #{player_1.lives}/#{player_1.initial_lives}"
    else
      puts "Player 2 wins! -> Score: #{player_2.lives}/#{player_2.initial_lives}"
    end

    puts "***** GAME OVER *****"
  end

  # Generate question with answer together in a hash
  # There's no way this needed to be a separate class
  def get_question
    a = rand(1..20)
    b = rand(1..20)
    {:text => "What is #{a} + #{b}?", :answer => a + b}
  end
end