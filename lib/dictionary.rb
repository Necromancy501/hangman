class Dictionary

  def initialize
    @dictionary = File.open('google-10000-english-no-swears.txt')
    @wordbank = File.open('wordbank.txt')
    @word = pick_word
    @wordbank_array = guesser_wordbank
  end

  def guesser_wordbank
    array = []
    @wordbank.each_line(chomp: true) do |line|
      array.push line
    end
    @wordbank.close
    array
  end

  def elegible_array
    elegible = @dictionary.select do |word|
      word.length.between?(5, 12)
    end
    @dictionary.close
    elegible.map do |word|
      word.chomp
    end

  end

  def pick_word
    elegible_array.sample
  end

  def word
    @word
  end

  def guesser_words
    @wordbank_array
  end
end