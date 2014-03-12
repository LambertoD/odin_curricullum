class Calculator
  def hours_in_a_year
    puts "There are #{24 * 365} hours in a year"
    24 * 365
  end
  def minutes_in_a_decade
    minutes_per_year = hours_in_a_year * 60
    puts "There are #{minutes_per_year} in a year"
    puts "There are #{minutes_per_year * 10} minutes in a decade"
  end
  def seconds_old(year)
    seconds_per_year = hours_in_a_year * 60 * 60
    puts "if you are #{year} years old, you are then #{seconds_per_year} seconds old"
  end
  def seconds_to_year(seconds)
    year = seconds / hours_in_a_year / 60 /60
    puts "if you are #{seconds} seconds old, then you are #{year} years old" 
  end
  def chocolotes_to_eat(days_in_year)
    
  end

end