require File.join(File.dirname(__FILE__), 'categoriser')

class GildedRose

  attr_reader :categorised_items

  include Categoriser

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
