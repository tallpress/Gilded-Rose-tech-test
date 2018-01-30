require File.join(File.dirname(__FILE__), 'item')

module AgedBrie

  def alter(item)
    item.quality += 1
    item.sell_in -= 1
  end

end
