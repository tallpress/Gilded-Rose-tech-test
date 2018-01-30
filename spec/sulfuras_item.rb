require File.join(File.dirname(__FILE__), '../lib/sulfuras_item')

describe SulfurasItem do

  it "should update quality and sell_in as required" do
    sulfuras_item = Item.new("test", 10, 10)
    categorised_item = SulfurasItem.new(sulfuras_item)
    categorised_item.alter()
    expect(categorised_item.item.quality).to eq 10
    expect(categorised_item.item.sell_in).to eq 10
  end
end
