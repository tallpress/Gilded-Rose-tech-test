require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'standard_item_behaviours')

class ConjuredItem < Item

  include StandardItemBehaviours

  attr_accessor :item
  
  MAX_QUALITY = 50

  def initialize(item)
    @item = item
  end

  def alter
    pass_time()
    alter_quality()
  end

  private

  def alter_quality
    if @item.quality > MIN_QUALITY
      @item.quality -= 2
    end
    limit_quality_to_zero()
  end

end
