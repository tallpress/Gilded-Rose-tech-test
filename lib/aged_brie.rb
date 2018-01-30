require File.join(File.dirname(__FILE__), 'item')

class AgedBrie < Item
  attr_accessor :item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(item)
    @item = item
  end

  def alter
    @item.quality += 1
    @item.sell_in -= 1
  end

  private
  def quality_alter
    if @item.quality >= MIN_QUALITY && @item.quality <= MAX_QUALITY
      @item.quality += 1
    end
  end

end
