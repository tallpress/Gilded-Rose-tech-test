require File.join(File.dirname(__FILE__), '../lib/aged_brie')

describe AgedBrie do

  it "should update quality and sell_in as required" do
    brie = Item.new("Aged Brie", 10, 10)
    categorised_item = AgedBrie.new(brie)
    categorised_item.alter()
    expect(categorised_item.item.quality).to eq 11
    expect(categorised_item.item.sell_in).to eq 9
  end
end
