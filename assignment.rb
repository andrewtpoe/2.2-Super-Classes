# 2.2 Super Classes - Andrew T. Poe
# Dinosaurs

class Dinosaur
  attr_accessor :is_alive, :number_of_legs, :habitat, :size, :fight_level,
                         :defense_level, :mode_of_transportation, :is_mother

  def initialize
    @is_alive = true
  end

  def fight(victim)
    defense_level = victim.defense_level
    if @fight_level > defense_level
      victim.is_alive = false
      puts "GAHHHhhhhh........"
      puts ""
      return true
    else
      puts "Not tonight, ya brute!"
      puts ""
      return false
    end
  end

  def move
    case @mode_of_transportation
    when "walk"
      puts "walking the line, walking the line"
    when "fly"
      puts "Ready for takeoff! Flap, Flap, Flap!!!"
    when "swim"
      puts "Your going to want to hold your breathe."
    else
      puts "Can't. Need a wheelchair."
    end
  end

  def rawr
    puts "RAWRRRR"
  end

end


class Carnivore < Dinosaur
  attr_accessor :diet

  def initialize
    @diet = "meat"
    super
  end

  def find_food(victim)
    puts "ATTACK!!!!!!"
    puts ""
    kill = fight(victim)
    if kill
      puts "Dinner time!!!!!!!"
      puts ""
    else
      puts "Another day..."
      puts ""
    end
  end

end


class Herbivore < Dinosaur
  attr_accessor :diet

  def initialize
    @diet = "plants"
    super
  end

  def find_food
    puts "Browsing plant life for tasty treats"
  end

  def fight(victim)
    if @is_mother
      fight_level = @fight_level + 10
      if fight_level > victim.defense_level
        puts "Leave my babies alone and never come back!!!!!!!"
      else
        puts "NOOOOOO!!!!!!!!!!!"
      end
    else
      super
    end
  end

end

trex = Carnivore.new
trex.number_of_legs = 2
trex.size = "L"
trex.fight_level = 5
trex.defense_level = 4
trex. mode_of_transportation = "walk"

triceratops = Herbivore.new
triceratops.number_of_legs = 4
triceratops.size = "XL"
triceratops.fight_level = 2
triceratops.defense_level = 5
triceratops.mode_of_transportation = "walk"
triceratops.is_mother = true

pterodactyl = Carnivore.new
pterodactyl.number_of_legs = 2
pterodactyl.size = "S"
pterodactyl.fight_level = 5
pterodactyl.defense_level = 5
pterodactyl.mode_of_transportation = "fly"



puts "On our nature walk through Jurassic World we see a showdown."
puts "Looks like the T-Rex is hungry, and he has found a triceratops "
puts "to prey upon! Who will win???"
puts ""

puts "T-rex says:"
puts "#{trex.rawr}I'm a #{trex.class.superclass}"
puts ""

trex.find_food(triceratops)

if triceratops.is_alive
  puts "Triceratops says: "
  puts "Try again Mr. Bully!!!!"
  puts ""
end

puts "Look there! It's a Pterodactyl getting ready to take off!"
puts ""
puts "Pterodactyl says: "
pterodactyl.move

puts ""
puts "But wait! That Pterodactyl is after the Triceratops babies!"
puts "Let's see if she can defend her young!"
puts ""
puts "Triceratops says: "

triceratops.fight(pterodactyl)
