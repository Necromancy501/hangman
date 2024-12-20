class Stickman
  def initialize
    @stages = [
      <<-STICK,
      
      
      
STICK
      <<-STICK,
    o
    
    
STICK
      <<-STICK,
    o
    |
    
STICK
      <<-STICK,
    o
   /|
    
STICK
      <<-STICK,
    o
   /|\\
    
STICK
      <<-STICK,
    o
   /|\\
   /
STICK
      <<-STICK,
    o
   /|\\
   / \\
STICK
  ].reverse!
    @current_stage = 0
  end

  def to_s
    "\n"+@stages[@current_stage]+"\n"
  end

  def burn
    @current_stage += 1 unless @current_stage == @stages.length-1
  end
end
