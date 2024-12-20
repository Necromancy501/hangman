class Serialize
  def initialize game
    @game = game
  end

  def to_marshall
    { stickman: @game.stickman, guesser: @game.guesser }
  end

  def save
    saved = Marshal.dump(self.to_marshall)
    File.open("game_state.sav", "wb") { |file| file.write(saved) }
  end

  def load
    loaded = File.open('game_state.sav', 'rb') do |file|
      Marshal.load(file)
    end

    @game.stickman = loaded[:stickman]
    @game.guesser = loaded[:guesser]
    @game.rules = Ruleset.new @game.dictionary, @game.guesser, @game.stickman

  end

  def suite
    if File.exist?('game_state.sav')
      p 'Would you like to continue your existing game? [Y/N]'
      choice = gets.chomp.downcase
      case choice
      when 'y', 'yes'
        self.load
      end
    end
  end

  def close
    begin
      File.delete('game_state.sav')
    rescue Errno::ENOENT
    end
  end
end