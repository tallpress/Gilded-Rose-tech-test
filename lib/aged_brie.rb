require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'standard_item_behaviours')

class AgedBrie < Item

  include StandardItemBehaviours

  attr_accessor :item

  MAX_QUALITY = 50

  def initialize(item)
    @item = item
  end

  def alter
    alter_quality()
    pass_time()
  end

  private
  def alter_quality
    if @item.quality < MAX_QUALITY
      change_qual()
    end
  end

  def change_qual
    if @item.sell_in < SELL_BY_DATE
      @item.quality += 2
    else
      @item.quality += 1
    end
  end

end
