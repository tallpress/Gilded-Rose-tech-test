require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'standard_item_behaviours')

class NormalItem < Item

  include StandardItemBehaviours

  attr_accessor :item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(item)
    @item = item
  end

  def alter
    pass_time()
    alter_quality()
  end

  private
  def alter_quality
    if @item.sell_in > 0
      @item.quality -= 1
    elsif @item.sell_in <= 0
      @item.quality -= 2
    end
    limit_quality_to_zero()
  end

end
