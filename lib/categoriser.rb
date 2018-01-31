require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'aged_brie')
require File.join(File.dirname(__FILE__), 'backstage_pass')
require File.join(File.dirname(__FILE__), 'conjured_item')
require File.join(File.dirname(__FILE__), 'normal_item')
require File.join(File.dirname(__FILE__), 'sulfuras_item')

module Categoriser

  def categorise_items
    @items.each do |item|
      if isAgedBrie?(item)
        to_add = AgedBrie.new(item)
      elsif isSulfuras?(item)
        to_add = SulfurasItem.new(item)
      elsif isBackstagePass?(item)
        to_add = BackstagePass.new(item)
      elsif isConjured?(item)
        to_add = ConjuredItem.new(item)
      elsif isNormalItem?(item)
        to_add = NormalItem.new(item)
      end
      categorised_items.push(to_add)
    end
  end

  def isAgedBrie?(item)
    item.name == 'Aged Brie' ? true : false
  end

  def isSulfuras?(item)
    item.name.include?("Sulfuras") ? true : false
  end

  def isBackstagePass?(item)
    item.name.include?("Backstage pass") ? true : false
  end

  def isConjured?(item)
    item.name.include?("Conjured") ? true : false
  end

  def isNormalItem?(item)
    if (isAgedBrie?(item) || (isSulfuras?(item) || (isBackstagePass?(item) || isConjured?(item))))
      return false
    else
      return true
    end
  end

end
