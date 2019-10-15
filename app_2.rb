require 'bundler'
Bundler.require

require_relative './lib/player.rb'

puts "------------------------------------------------ "
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts " Avant de commencer à jouer, choisis ton pseudo ! "
print "> "
name = gets.chomp
puts "Welcome to the game #{name}, la partie peut commencer !\n"
gets.chomp
player = HumanPlayer.new("#{name}")
p1 = Player.new("Josiane")
p2 = Player.new("José")
while (p1.hp > 0 || p2.hp > 0) && player.hp > 0
puts "-"  * 80
puts "\n"
player.show_state
puts "\n"
puts "Quelle action veux-tu effectuer ? \n \n"
puts "a - Chercher une meilleure arme "
puts "b - Chercher à se soigner\n\n"
puts "Attaquer un joueur en vue : "
puts "0 - #{p1.show_state}"
puts "1 - #{p2.show_state}"
print " >"
cmd = gets.chomp.to_s
if cmd == "a"
player.search_weapon
elsif cmd == "b"
player.search_health_pack
	elsif cmd == "0"
player.attacks(p1)
	elsif cmd == "1"
player.attacks(p2)
	else
	puts "Commande inconnue, appuie sur la touche 'a', 'b', '0' ou '1' en fonction de l'action que tu veux faire "
	end
	gets.chomp
	if p1.hp > 0 || p2.hp > 0
	puts "Attention !\nJosiane et José s'apprêtent à t'attaquer ! "
	end
	gets.chomp
	enemies = []
	enemies << p1
	enemies << p2
	enemies.each do |fighters|
	if fighters.hp > 0 && player.hp > 0 
	fighters.attacks(player)
	gets.chomp
	end
end
end

if player.hp > 0 && p1.hp <= 0 && p2.hp <= 0
puts " WINNER WINNER CHICKEN DINNER ! Tu as gagné le combat, GG !".green
else
puts "Bah alors tu perds contre deux pauvres bots avec 10 hp ?\n ".red
end

puts "Pour relancer une partie, tape 'go'"
print "> "
go = gets.chomp.to_s
if go == "go"
	load'app_2.rb'
end

binding.pry
puts " end of file"


