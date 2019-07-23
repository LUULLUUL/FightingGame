require "pry"

class Player
  
  attr_accessor :name, :life_points
  

  def initialize(name)
    @name = name
    @life_points = 10
   end   

  def gets_damage(damage) #call with the compute damage
    @life_points = @life_points - damage.to_i
  end
  
  def show_state
    puts "#{@name} has #{@life_points} points left!"
    
    if @life_points <= 0
      puts "the player #{@name} has been killed!"
    
    end  
  end 

  def attacks (attacked_player)
    damage = self.compute_damage
  
    puts "#{@name} attaque #{attacked_player.name}" 
    puts "il lui inflige #{damage} points de dommages"
    attacked_player.gets_damage(damage)
  end


  def compute_damage
    return rand(1..6)
  end
end  

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @weapon_level = 1
    @life_points = 100
  end  

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    ran_dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{ran_dice}"
    if @weapon_level < ran_dice
      @weapon_level = ran_dice
      puts "Congrats! Ta nouvelle arme est mieux que la precedente, tu la gardes"
    else
      puts "Cette arme est moins puissante que celle que tu as dans les mains, tu ne la gardes pas"
    end
  end

def search_health_pack
   ran_dice = rand(1..6)
   case ran_dice
   when 1
      puts "Tu n'as rien trouvé..."
   when (2..5)
      puts "Tu a trouvé 50 points de vie!"
      if @life_points <= 50
        @life_points += 50 
      else
        @life_points += (100-@life_points)   
      end 
   when 6
      puts "Tu a trouvé 80 points de vie!"
      if @life_points <= 20
        @life_points += 80 
      else
        @life_points += (100-@life_points)   
      end    
    end  
end  

end  
