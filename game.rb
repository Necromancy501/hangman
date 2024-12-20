require_relative 'lib/dictionary'
require_relative 'lib/stickman'
require_relative 'lib/guesser'
require_relative 'lib/ruleset'
require_relative 'lib/serialize'

class Game
  attr_accessor :stickman, :guesser, :rules
  attr_reader :dictionary

  def initialize

    @dictionary = Dictionary.new
    @word = @dictionary.word
    @allowed_guesses = @dictionary.guesser_words

    @stickman = Stickman.new
    @guesser = Guesser.new @word
    @rules = Ruleset.new @dictionary, @guesser, @stickman
    @serializer = Serialize.new self

    @serializer.suite

  end
  
  def round
    puts @stickman, @guesser, "\nPlease enter a guess. Enter 0 to close"
    @rules.guess
    @stickman.burn
    @guesser.update
    @serializer.save
  end

  def match
    until @rules.win || @rules.end 
      self.round
    end
    @serializer.close
  end

end

hangman = Game.new
hangman.match
