require File.join(File.dirname(__FILE__), '../lib/normal_item')

describe NormalItem do

  it "should update quality and sell_in as required" do
    normal_item = Item.new("test", 10, 10)
    categorised_item = NormalItem.new(normal_item)
    categorised_item.alter()
    expect(categorised_item.item.quality).to eq 9
    expect(categorised_item.item.sell_in).to eq 9
  end
end
