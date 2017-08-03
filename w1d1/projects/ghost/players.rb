class Player
  attr_accessor :name

  def initialize(name = "player")
    @name = name
  end

  def guess
    input = gets.chomp
    if alert_invalid_guess(input)
      puts "Please input one character at a time."
      print "Please give a valid input #{@name}: "
      guess
    else
      return input
    end
  end

  def alert_invalid_guess(input)
    input.length != 1
  end

end
