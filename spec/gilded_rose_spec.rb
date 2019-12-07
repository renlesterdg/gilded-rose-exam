require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do
  let(:name) { "item" }
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }
  let(:items) { [item] }
  subject { GildedRose.new(items) }

  before(:each) do
    subject.update_quality
  end

  describe "#update_quality" do
    it "lowers the item sellin by 1" do
      expect(item.sell_in).to eq 4
    end

    it "lowers the quality by 1" do
      expect(item.quality).to eq 9
    end

    context "when a quality is 0" do
      let(:initial_quality) { 0 }

      it "cannot go negative" do
        expect(item.quality).to be >=0
      end
    end

    context "when sell by date has passed" do
      let(:initial_sell_in) { -1 }

      it "quality degrades twice as fast" do
        expect(item.quality).to eq 8 # from 10 it goes to 8
      end
    end

    context "when item name is #{ GildedRose::AGED_BRIE } " do
      let(:name) { GildedRose::AGED_BRIE }

      it "increases quality the older it gets" do
        expect(item.quality).to eq 11 # from 10 it goes to 11
      end

      context "and quality is 50" do
        let(:initial_quality) { 50 }

        it "cannot exceed 50" do
          expect(item.quality).to be <= 50
        end
      end
    end

    context "when item name is #{ GildedRose::SULFURAS }" do
      let(:name) { GildedRose::SULFURAS }

      it "has no sell by date" do
        expect(item.sell_in).to eq 5
      end

      it "doesnt decrease quality" do
        expect(item.quality).to eq 10
      end

      context "when quality is 80" do
        let(:initial_quality) { 80 }
        it "never alters" do
          expect(item.quality).to eq 80
        end
      end
    end

    context "when item name is #{ GildedRose::BACKSTAGE_PASSES }" do
      let(:name) { GildedRose::BACKSTAGE_PASSES }

      context "and sell in is 11 days" do
        let(:initial_sell_in) { 11 }

        it "increases quality by 1" do
          expect(item.quality).to eq 11
        end
      end

      context "and sell in is 100 days" do
        let(:initial_sell_in) { 100 }

        it "increases quality by 1" do
          expect(item.quality).to eq 11
        end
      end

      context "and sell in is 10 days" do
        let(:initial_sell_in) { 10 }

        it "increases quality by 2" do
          expect(item.quality).to eq 12
        end
      end

      context "and sell in is 9 days" do
        let(:initial_sell_in) { 9 }

        it "increases quality by 2" do
          expect(item.quality).to eq 12
        end
      end

      context "and sell in is 6 days" do
        let(:initial_sell_in) { 10 }

        it "increases quality by 2" do
          expect(item.quality).to eq 12
        end
      end

      context "and sell in is 5 days" do
        it "increases quality by 3" do
          expect(item.quality).to eq 13
        end
      end

      context "and sell in is 4 days" do
        it "increases quality by 3" do
          expect(item.quality).to eq 13
        end
      end

      context "and sell in is 1" do
        let(:initial_sell_in) { 1 }

        it "increases quality by 3" do
          expect(item.quality).to eq 13
        end
      end

      context "and sell in is 0" do
        let(:initial_sell_in) { 0 }

        it "sets the quality to 0" do
          expect(item.quality).to eq 0
        end
      end
    end

    context "when item name is #{ GildedRose::CONJURED }" do
      let(:name) { GildedRose::CONJURED }

      it "lowers the item sellin by 2" do
        expect(item.quality).to eq 8
      end

      context "when a quality is 0" do
        let(:initial_quality) { 0 }

        it "cannot go negative" do
          expect(item.quality).to be >=0
        end
      end

      context "when sell by date has passed" do
        let(:initial_sell_in) { 0 }

        it "quality degrades twice as fast" do
          expect(item.quality).to eq 6
        end

        context "when a quality is already 0" do
          let(:initial_quality) { 0 }

          it "cannot go negative" do
            expect(item.quality).to be >=0
          end
        end
      end
    end    

    context "with multiple items" do
      let(:items) do
        [
          Item.new("NORMAL ITEM", 5, 10),
          Item.new(GildedRose::AGED_BRIE, 3, 10),
          Item.new(GildedRose::CONJURED, 4, 10),
          Item.new(GildedRose::CONJURED, 0, 10),
          Item.new(GildedRose::CONJURED, -1, 10)
        ]
      end

      it "normal item should should lower their sellin and quality by 1" do
        expect(items[0].sell_in).to eq(4)
        expect(items[0].quality).to eq(9)
      end

      it "#{ GildedRose::AGED_BRIE } item should lower their sellin and increases quality the older it gets" do
        expect(items[1].sell_in).to eq(2)
        expect(items[1].quality).to eq(11)
      end

      it "#{ GildedRose::CONJURED } item should be degrade `quality` twice as fast as normal items" do
        expect(items[2].quality).to eq(8)
        expect(items[3].quality).to eq(6)
        expect(items[4].quality).to eq(6)
      end
    end
  end
end
