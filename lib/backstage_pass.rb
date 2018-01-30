require File.join(File.dirname(__FILE__), 'item')

class BackstagePass < Item
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def alter
    @item.sell_in -= 1
    alter_quality();
  end

  private

  def alter_quality
    if @item.sell_in > 10
      @item.quality + 1
    elsif @item.sell_in <= 10
      @item.quality += 2
    elsif @item.sell_in <= 5
      @item.quality += 3
    else
      @item.quality = 0
    end
  end
end
