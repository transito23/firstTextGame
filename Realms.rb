class Realm
  attr_accessor :name, :gold, :item, :north, :south, :east, :west

  def initialize(name, gold, item)
    @name = name
    @gold = gold
    @item = item
    @north = nil
    @south = nil
    @east = nil
    @west = nil
  end

  def get_dimension(portal)
    if portal == "n"
      @north
    elsif portal == "s"
      @south
    elsif portal == "e"
      @east
    elsif portal == "w"
      @west
    else
      nil
    end
  end

  def dimensions
    puts "{#{@name}}|this realm has (#{@gold} gold) on the floor"
    puts
    puts "ENTER h for some guidelines"
    puts

    if @north == nil
      puts "North --> nothing"
    else
      puts "North --> #{@north.name}"
    end

    if @south == nil
      puts "South --> nothing"
    else
      puts "South --> #{@south.name}"
    end

    if @east == nil
      puts "East --> nothing"
    else
      puts "East --> #{@east.name}"
    end

    if @west == nil
      puts "West --> nothing"
    else
      puts "West --> #{@west.name}"
    end
  end
end
