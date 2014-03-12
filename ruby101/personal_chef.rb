require 'date'
class PersonalChef

  def make_toast(color)
    if color.nil?
      puts "how am i supposed to make nothingness toast?"
    else
      puts "Making your toast #{color}"
    end
    self
  end
  def make_milkshake(flavor)
    puts "Making some #{flavor} milkshake"
    self
  end
  def make_eggs(quantity)
    quantity.times do 
      puts  "making an egg"
    end
    puts "I'm done"
    self
  end
  def game_plan(meals)
    meals.each do |meal|
      puts "We will have #{meal}"
    end
    all_meals = meals.join(", ")
    puts "in summary: #{meals}"
  end
  def inventory
    produce = {apples: 3, oranges: 1, carrots: 12}
    produce.each do |item, quantity|
      puts "There are #{quantity} #{item} in the fridge"
    end
  end
  def water_status(minutes)
    if minutes < 7
      puts "The water is not boiling"
    elsif minutes == 7
      puts "It's barely boiling at #{minutes} minutes"
    elsif minutes == 8
      puts "It's boiling"
    else
      puts "Hot, hot, HOT!"
    end
    self
  end
  def countdown(counter)
    while counter > 0
      puts "The counter is #{counter}"
      counter-= 1
    end
    self    
  end
  def good_morning
    puts "Happy #{Date.today.strftime("%A")}, it's the #{Date.today.yday}th day of #{Date.today.year} " 
  end
  def to_s
    puts "Hello I'm the chef, glad to be of service"
  end

end

class Butler

  def open_door(door)
    puts "Opening #{door} door"
    self
  end

  def to_s
    "I am the butler"
  end

end