require './player'
require './question'

class Game

  attr_reader :player1, :player2
  # Generates one question for each player per round
  # The question does this by checking the response of the player to the Game's answer 
  #   "The game steals the lives of the players"
  # initialized: Two Players with three lives? 
  # Manages the current_player 
  # It contains the game loop
  # It will contain the user I/O (puts.... google how to read get data? statement)
  
  # constructor
  def initialize

    # initializing players
    @player1 = Player.new("Naruto")
    @player2 = Player.new("Sasuke")
    @players = [@player1, @player2]
    @currentplayer = @player1
    
    play
  end

  # nextRound
  def nextRound
      unless (player1.dead || player2.dead)
        puts "----- NEW TURN -----"
      end
  end

  #Switch Between Players
  def switchPlayer
    @currentplayer = @currentplayer == @player1 ? @player2 : @player1
  end

  #current health between the two players
  def currentHealth
    puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
  end

  def gameOver
    puts "#{@currentplayer.name} wins with a score #{@currentplayer.life}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def play 

    while !@player1.dead && !@player2.dead
    
      newQuestion = Question.new
     
      puts "#{@currentplayer.name}: What does #{newQuestion.numOne} plus #{newQuestion.numTwo} equal?"
      answer = $stdin.gets.chomp.to_i
      if answer == newQuestion.answer
        puts "#{@currentplayer.name}: Yes! You are correct."
      else 
        puts "#{@currentplayer.name}: No. You are dying..."
        @currentplayer.dying
      end
      currentHealth
      nextRound
      switchPlayer
    end
    gameOver
  end
end
