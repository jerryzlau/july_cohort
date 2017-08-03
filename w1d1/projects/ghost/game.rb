require_relative "players.rb"

class Game


  def initialize(players)
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
    @players = players
    @current_player = players.first
    @fragment = ""
    @losses = {}
    @players.each {|player| @losses[player.name] = 0}
  end

  def next_player!
    if @current_player == @players.first
      @current_player = @players.last
    else
      @current_player = @players.first
    end
  end

  def take_turn(player)
    puts "#{player.name}! Give me a letter."
    @fragment += player.guess

    until valid_play?(@fragment)
      puts "Input is not part of a substring in the dictionary."
      puts "Please try a different letter."
      @fragment = @fragment[0..-2]
      @fragment += player.guess
    end

    puts "#{player.name} has guessed [#{@fragment[-1]}]. The current fragment is [#{@fragment}]."
    puts "----------------------------------------------------"
  end

  def valid_play?(string)
    @dictionary.any? do |word|
      word[0..string.length-1] == string
    end
  end


  def loss?(fragment)
    @dictionary.any? {|word| word == fragment}
  end

  def play_round

    until loss?(@fragment)
      take_turn(@current_player)
      next_player!
    end


    next_player!
    puts "#{@current_player.name} has lost this round."


    @losses[@current_player.name] += 1
  end

  def run
    until @losses.values.include?(5)
      @fragment
      play_round
      @fragment = ""
    end

    loser = @losses.select {|k,v| v == 5}.to_a.first.first
    puts "#{loser} is the GHOST!"
  end

end

if __FILE__ == $PROGRAM_NAME
  player_one = Player.new("Justin")
  player_two = Player.new("Jerry")
  game = Game.new([player_one, player_two])
  game.run
end
