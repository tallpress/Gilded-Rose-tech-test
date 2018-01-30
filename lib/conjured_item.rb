require File.join(File.dirname(__FILE__), 'item')

class ConjuredItem < Item
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def alter
    @item.quality -= 2
    @item.sell_in -= 1
  end

end
