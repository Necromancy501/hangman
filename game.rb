require_relative 'lib/dictionary'
require_relative 'lib/stickman'
require_relative 'lib/guesser'
require_relative 'lib/ruleset'

class Game

  def initialize

    @dictionary = Dictionary.new
    @word = @dictionary.word
    @allowed_guesses = @dictionary.guesser_words

    @stickman = Stickman.new
    @guesser = Guesser.new @word
    @rules = Ruleset.new @dictionary, @guesser

  end
  
  def round
    puts @stickman, @guesser, "\nPlease enter a guess"
    @rules.guess
    @stickman.burn
    @guesser.update
  end

  def match
    until @rules.win || @rules.end 
      self.round
    end
  end

end

hangman = Game.new
hangman.match



