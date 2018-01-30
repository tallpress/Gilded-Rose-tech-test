require File.join(File.dirname(__FILE__), 'item')

class AgedBrie < Item
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def alter
    @item.quality += 1
    @item.sell_in -= 1
  end

end
