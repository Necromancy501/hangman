class Ruleset
  
  def initialize dictionary, guesser
    @round = 1
    @dictionary = dictionary
    @guesser = guesser
    @word_submitted = ''
  end

  def guess

    allowed_guesses = @dictionary.guesser_words
    set_letters = @guesser.letters_guessed
    guess_submitted = false

    until guess_submitted
      @word_submitted = gets.chomp.downcase
      set_given = Set.new
      if allowed_guesses.include? @word_submitted
        @word_submitted.each_char do |letter|
          set_given.add letter
        end
        set_given.each do |char|
          set_letters.add char
        end
        @round += 1
        guess_submitted = true
      else
        p "Please enter a valid word"
      end
    end
  end

  def end
    if @round == 7
      p "Game Over!! The word was #{@guesser.word}"
      true
    end
  end

  def win
    if @word_submitted == @guesser.word
      p 'You win!'
      true
    end
  end


end