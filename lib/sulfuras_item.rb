require File.join(File.dirname(__FILE__), 'item')

class SulfurasItem < Item
  attr_accessor :item
  MAX_QUALITY = 80

  def initialize(item)
    @item = item
  end

  def alter
    # doesn't need to change 
  end

end
