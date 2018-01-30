require File.join(File.dirname(__FILE__), '../lib/backstage_pass')

describe BackstagePass do

  it "should update quality and sell_in as required" do
    backstage_pass = Item.new("Backstage pass, test", 10, 10)
    categorised_item = BackstagePass.new(backstage_pass)
    categorised_item.alter()
    expect(categorised_item.item.quality).to eq 12
    expect(categorised_item.item.sell_in).to eq 9
  end
end
