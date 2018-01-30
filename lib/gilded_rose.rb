require File.join(File.dirname(__FILE__), 'item')

class GildedRose

  NORMAL_ITEM_MAX_QUALITY = 50
  LEGENDARY_ITEM_MAX_QUALIRY = 80
  ITEM_MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality

    @items.each do |item|

      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        if item.quality > 0
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < NORMAL_ITEM_MAX_QUALITY
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < 11
              item.quality = item.quality + 1 if item.quality < NORMAL_ITEM_MAX_QUALITY
            end
            if item.sell_in < 6
              item.quality = item.quality + 1 if item.quality < NORMAL_ITEM_MAX_QUALITY
            end
          end
        end
      end

      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < ITEM_MIN_QUALITY
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > ITEM_MIN_QUALITY
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          item.quality = item.quality + 1 if item.quality < NORMAL_ITEM_MAX_QUALITY
        end
      end

    end
  end
end