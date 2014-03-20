class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    rice_order = 0
    noodle_order = 0

    orders.each do |hash|
      rice_order += hash[:rice] if hash[:rice]
      noodle_order += hash[:noodles] if hash[:noodles]
    end

    puts @menu[:rice]
    puts @menu[:noodles]
    cost = rice_order * @menu[:rice] +
      noodle_order * @menu[:noodles]
  end
end
