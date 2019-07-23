require "pry"
class Game

  attr_accessor :human_player, :HumanPlayer, :enemies

  def initialize
    @human_player
    @HumanPlayer
    @enemies = []
  end

  def menu
    puts "Quelle action veux-tu effecture?"
      puts "a - chercher une meilleure arme"
      puts "b - chercher à se soigner"
      puts
      puts "attaquer un joueur eb vue: "
      puts "0 - #{e1.show_state} "
      puts "1 - #{e2.show_state} "
  end 
end
