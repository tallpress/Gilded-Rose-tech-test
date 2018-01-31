require File.join(File.dirname(__FILE__), 'item')

class ConjuredItem < Item
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
      if @item.quality > MIN_QUALITY + 2
        @item.quality -= 2
      end
    end

end
