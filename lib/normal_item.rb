require File.join(File.dirname(__FILE__), 'item')

class NormalItem < Item
  attr_accessor :item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(item)
    @item = item
  end

  def alter
    @item.sell_in -= 1
    quality_alter()
  end

  private
  def quality_alter
    if @item.sell_in > 0
      @item.quality -= 1
    elsif @item.sell_in <= 0
      @item.quality -= 2
    end
    limit_quality_to_zero()
  end

  def limit_quality_to_zero
    if @item.quality <= MIN_QUALITY
      @item.quality = MIN_QUALITY
    end
  end

end
