require File.join(File.dirname(__FILE__), 'categoriser')

class GildedRose

  attr_reader :categorised_items

  include Categoriser

  NORMAL_ITEM_MAX_QUALITY = 50
  LEGENDARY_ITEM_MAX_QUALIRY = 80
  ITEM_MIN_QUALITY = 0

  attr_accessor :categorised_items

  def initialize(items)
    @items = items
    @categorised_items = []
  end

  def update_quality
    categorise_items()
    categorised_items.each do |item|
      item.alter()
    end
  end

end
