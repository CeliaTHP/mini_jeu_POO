require 'pry'

class Player 
attr_accessor :name, :hp

def initialize(name)
@name = name
@hp = 10
end

def show_state
if hp > 0
puts "Le joueur #{@name} a #{@hp} points de vie "
else
puts " Le joueur #{@name} est mort ! "
end
end

def gets_damage(dmg)
@hp = @hp - dmg
if @hp <=  0
puts "Le joueur #{@name} est mort ! R.I.P"
end
end

def compute_damage
return rand(1..6)
end

def attacks(victim)
puts "#{@name} attaque #{victim.name}"
dmg = compute_damage
puts "#{victim.name} subit #{dmg} points de dommages"
victim.gets_damage(dmg)
end
end

class HumanPlayer < Player 
attr_accessor :weapon_lvl

def initialize(name)
@name = name
@hp = 100
@weapon_lvl = 1
end

def show_state
if hp > 0
puts "Le joueur #{@name} a #{@hp} points de vie et une arme de lvl #{weapon_lvl} "
else 
puts " Le joueur #{@name} est mort ! "
end
end

#need une condition pour que le joueur mort ne puisse pas se heal 

def compute_damage
return rand(1..6) * @weapon_lvl
end

def search_weapon
@wlvl = rand(1..6)
puts " Tu as trouvé une arme de niveau #{@wlvl}"
if (@wlvl.to_i <= @weapon_lvl.to_i)
puts " Une arme lvl #{@wlvl} alors que ton arme actuelle est lvl #{@weapon_lvl}, c'est pas worth, tu gardes ton arme actuelle"
else
puts "Oh ! une arme de niveau #{@wlvl}, ça part direct dans l'inventaire!"
@weapon_lvl = @wlvl
end
end

def search_health_pack
x = rand(1..6)
if x >= 2 && x <= 5
puts "Tu as trouvé un pack de soin ! + 50 HP"
if (@hp + 50) > 100
@hp = 100
else
@hp = @hp + 50
end
elsif x == 6 
puts " Wow insane un SUPER pack de soin , + 80 HP"
if (@hp + 80) > 100
@hp = 100
else
@hp = @hp + 80
end
else
puts "Tu n'as rien trouvé, dommage"
end
puts " Tu as maintenant #{@hp} HP "
end
end


#binding.pry
#puts " end of file "
