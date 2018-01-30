require File.join(File.dirname(__FILE__), '../lib/conjured_item')

describe ConjuredItem do

  it "should update quality and sell_in as required" do
    conjured_item = Item.new("Conjured test", 10, 10)
    categorised_item = ConjuredItem.new(conjured_item)
    categorised_item.alter()
    expect(categorised_item.item.quality).to eq 8
    expect(categorised_item.item.sell_in).to eq 9
  end
end
