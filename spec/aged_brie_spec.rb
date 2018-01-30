require File.join(File.dirname(__FILE__), '../lib/aged_brie')

describe AgedBrie do

  before(:each) do
    @brie = Item.new("Aged Brie", 10, 10)
    @g_r = GildedRose.new([@brie])
  end

  it "should update quality and sell_in as required" do
    @g_r.alter(@brie)
    expect(@brie.quality).to eq 11
    expect(@brie.sell_in).to eq 9
  end
end
