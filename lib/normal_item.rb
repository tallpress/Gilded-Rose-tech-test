require File.join(File.dirname(__FILE__), 'item')

class NormalItem < Item
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def alter
    @item.sell_in -= 1
    @item.quality -= 1 
  end

end
