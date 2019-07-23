require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def perform
  puts "Bienvenue sur 'ILS VEULENT TOUS MA POO'!"
  puts "Whats your name?"
  namei = gets.chomp
  puts

  humanP1 = HumanPlayer.new(namei)
  e1 = Player.new("Guava")
  e2 = Player.new("DingDong")
  enemies = [e1, e2]
  count = 1 
    while humanP1.life_points > 0 && ( e1.life_points > 0 || e2.life_points >0)
      puts "Quelle action veux-tu effecture?"
      puts "a - chercher une meilleure arme"
      puts "b - chercher à se soigner"
      puts
      puts "attaquer un joueur eb vue: "
      #puts "0 - #{e1.show_state} "
      #puts "1 - #{e2.show_state} "
      i=0
      enemies.each do |enemy|
        puts "#{i} #{enemy.name} qui a #{enemy.life_points}"
        i=i+1
        end
        
      puts "------------------  Tour #{count} ------------------------ "

      answer = gets.chomp 
      puts "------------------------------------------ "
       
      #case answer
      if answer == "a"
        humanP1.search_weapon
      elsif answer == "b"
        humanP1.search_health_pack
      else
        humanP1.attacks(enemies[answer.to_i])   
         
      end
       enemies.each do |enemy| enemy.attacks(humanP1) end
       humanP1.show_state
      
       puts
      count += 1
    end
     
    


    if humanP1.life_points <= 0 
      puts "You died, stupid asshole." 
    else
      puts "Yaaaaaay you won!!!"
    end
end  
perform 