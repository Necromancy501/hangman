class Guesser

  attr_accessor :letters_guessed
  attr_reader :graphic, :word

  def initialize word
    @word = word
    @letters_guessed = Set.new
    @graphic = @word.gsub(/\S/, '_').split('').join(' ')
  end

  def update
    guessed = @graphic.split(' ').join('').downcase
    @letters_guessed.each do |letter|
      if @word.include? letter
        @word.each_char.with_index do |char, index|
          if char == letter
            guessed[index] = letter
          end
        end
      end
    end
    @graphic = guessed.split('').join(' ').upcase
  end

  def to_s
    @graphic
  end
end