require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform

  p1 = Player.new("Josiane")
  p2 = Player.new("Joe")
  count = 1

  while p1.life_points > 0 && p2.life_points > 0
    puts "------------------  Tour #{count} ------------------------ "
    puts 
    puts "Voici l'état de nos joueurs :"
    p1.show_state
    p2.show_state

    puts "Passons à la phase d'attaque : "
    p1.attacks(p2)
    p2.attacks(p1) if p2.life_points > 0
    puts
    count += 1
  end
  puts "end of game"
end  

perform