require 'bundler'
Bundler.require

require_relative './lib/player.rb'

p1 = Player.new("Josiane")
p2 = Player.new("José")
while p1.hp > 0 && p2.hp > 0
puts "\nVoici l'état de chaque joueur: \n"
p1.show_state
p2.show_state
puts "\n"
puts " Passons à la phase d'attaque : \n "
p1.attacks(p2)
if p2.hp <= 0 
break
end
p2.attacks(p1)
end

binding.pry
puts "end of file"
