require File.join(File.dirname(__FILE__), '../lib/gilded_rose')
require File.join(File.dirname(__FILE__), '../lib/item')


describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe "normal item" do
      it "should correctly update normal item above sell by date (remove one from quality and sell_in)" do
        items = [Item.new("normal item", 5, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
        expect(items[0].sell_in).to eq 4
      end

      it "should correctly update normal item below sell by date (quality degrates x2)" do
        items = [Item.new("noraml item", -1, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
        expect(items[0].sell_in).to eq -2
      end

      it "should not lower quality below 0 for a normal item" do
        items = [Item.new("normal item", 5, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 4
      end
    end

    describe "legendary item" do
      it "should not lower quality or sell in for legendary item" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
        expect(items[0].sell_in).to eq 5
      end
    end

    describe "Aged brie" do
      it "should let aged brie to increase in quality as appraoches sell by date" do
        items = [Item.new("Aged Brie", 5, 30)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 31
        expect(items[0].sell_in).to eq 4
      end

      it "should carry on increasing bries quality when sell by date passes" do
        items = [Item.new("Aged Brie", -2, 4)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 6
        expect(items[0].sell_in).to eq -3
      end

      it "should not be able to increase in quality over 50" do
        items = [Item.new("Aged Brie", 6, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
        expect(items[0].sell_in).to eq 5
      end
    end

    describe "backstage passes" do
      it "should increase in quality normally (+ 10 days) as approaches sell by approaches" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 4)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 5
        expect(items[0].sell_in).to eq 19
      end

      it "should increase in quality at double rate ( < 10 days but > 5 days) as approaches sell by approaches" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
        expect(items[0].sell_in).to eq 8
      end

      it "should increase in quality at tripple rate ( < 5 days but > 2 days) as approaches sell by approaches" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 13
        expect(items[0].sell_in).to eq 4
      end

      it "should have a quality of 0 after sell by date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq -1
      end

    end

    describe "checking instances of" do
      describe "#isAgedBrie?" do
        it "should return true if it is aged brie" do
          aged_brie = Item.new("Aged Brie", 5, 5)
          items = [aged_brie]
          g_r = GildedRose.new(items)
          expect(g_r.isAgedBrie?(aged_brie)).to eq true
        end
        it "should return false otherwise" do
          not_aged_brie = Item.new("Not Aged Brie", 5, 5)
          items = [not_aged_brie]
          g_r = GildedRose.new(items)
          expect(g_r.isAgedBrie?(not_aged_brie)).to eq false
        end
      end

      describe "#isSulfuras?" do
        it "should return true if the item is a sulfuras" do
          sulfura = Item.new("Sulfuras, test", 80, 4)
          items = [sulfura]
          g_r = GildedRose.new(items)
          expect(g_r.isSulfuras?(sulfura)).to eq true
        end
        it "should return false otherwise" do
          not_sulfura = Item.new("test", 30, 4)
          items = [not_sulfura]
          g_r = GildedRose.new(items)
          expect(g_r.isSulfuras?(not_sulfura)).to eq false
        end
      end

      describe "#isBackstagePass?" do
        it "should return true if the item is a backstage pass/passes" do
          backstage_pass = Item.new("Backstage pass for test", 30, 20)
          backstage_passes = Item.new("Backstage passes for test", 30, 20)
          items = [backstage_pass, backstage_passes]
          g_r = GildedRose.new(items)
          expect(g_r.isBackstagePass?(backstage_pass)).to eq true
          expect(g_r.isBackstagePass?(backstage_passes)).to eq true
        end
        it "should return false otherwise" do
          not_backstage_passes = Item.new("Not for test", 30, 20)
          items = [not_backstage_passes]
          g_r = GildedRose.new(items)
          expect(g_r.isBackstagePass?(not_backstage_passes)).to eq false
        end
      end

      describe "#isConjured?" do
        it "should return true if the item is conjured" do
          conjured_item = Item.new("Conjured item", 30, 20)
          items = [conjured_item]
          g_r = GildedRose.new(items)
          expect(g_r.isConjured?(conjured_item)).to eq true
        end
        it "should return false otherwise" do
          not_conjured_item = Item.new("Not for test", 30, 20)
          items = [not_conjured_item]
          g_r = GildedRose.new(items)
          expect(g_r.isConjured?(not_conjured_item)).to eq false
        end
      end

      describe "#isNormalItem?" do
        it "should return true if the item is normal" do
          normal_item = Item.new("bread", 30, 20)
          items = [normal_item]
          g_r = GildedRose.new(items)
          expect(g_r.isNormalItem?(normal_item)).to eq true
        end
        it "should return false otherwise" do
          not_normal_item = Item.new("Sulfuras, spade", 4, 2)
          items = [not_normal_item]
          g_r = GildedRose.new(items)
          expect(g_r.isNormalItem?(not_normal_item)).to eq false
        end
      end
    end

    describe "#categorised_items" do
      it "should change each item in the array to the item required" do
        items = [Item.new("Aged Brie", 5, 5), Item.new("Sulfuras, test", 5,3),
          Item.new("Backstage pass, test", 5, 5)]
        g_r = GildedRose.new(items)
        g_r.categorise_items()
        expect(g_r.categorised_items[0].class).to eq AgedBrie
        expect(g_r.categorised_items[1].class).to eq SulfurasItem
        expect(g_r.categorised_items[2].class).to eq BackstagePass
      end
    end
  end
end
