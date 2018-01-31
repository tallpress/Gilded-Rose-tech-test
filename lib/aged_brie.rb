require File.join(File.dirname(__FILE__), 'item')

class AgedBrie < Item
  attr_accessor :item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(item)
    @item = item
  end

  def alter
    @item.sell_in -= 1
    alter_quality()
  end

  private
  def alter_quality
    if @item.quality < MAX_QUALITY
      change_qual()
    end
  end

  def change_qual
    if @item.sell_in < 0
      @item.quality += 2
    else
      @item.quality += 1
    end
  end

end
