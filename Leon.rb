class Player
  attr_accessor :gold, :backpack

  def initialize(gold, backpack)
    @gold = gold
    @backpack = []
  end

  def put_in_backpack(item)
    @backpack << item
  end

end
