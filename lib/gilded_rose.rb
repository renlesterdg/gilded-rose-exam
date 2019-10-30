class GildedRose
  def initialize(items)
    @items = items
  end

  def update_aged_brie(item)
    # aged brie increases in quality
    item.quality += 1
  end

  def decrease_normal_item_quality(item)
    # if item sell by date passes, then quality decreases twice as fast
    if item.sell_in <= 0
      return item.quality -= 2
    end
    item.quality -= 1
  end

  def update_conjured(item)
    # if item sell by date passes, then quality decreases twice as fast
    if item.sell_in <= 0 && item.quality >= 4
      return item.quality -= 4
    end
    # conjured items decrease 2 times faster than normal items
    if item.quality >= 2
      item.quality -= 2
    end
  end

  def update_backstage_passes(item)
    # quality becomes 0 when sell by date passes for backstage passes
    if item.sell_in <= 0
      item.quality = 0
    # quality increase by 3 if sell by date is within 1 and 5, and also if quality is less than 48
    elsif item.sell_in <= 5 && item.sell_in > 0 && item.quality <= 47
      item.quality += 3
    # quality increase by 2 if sell by date is within 10 and 6, and also if quality is less than 49
    elsif item.sell_in <= 10 && item.sell_in > 5 && item.quality <= 48
      item.quality += 2
    else
      item.quality += 1
    end
  end

  def update_quality
    @items.each do |item|
      # if item is not sulfuras, and quality is within 1 and 49
      if item.quality > 0 && item.quality < 50 && item.name != "Sulfuras, Hand of Ragnaros"
        if item.name == "Aged Brie"
          update_aged_brie(item)
        elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
          update_backstage_passes(item)
        elsif item.name == "Conjured"
          update_conjured(item)
        else
          decrease_normal_item_quality(item)
        end
        # decreases the sell by date for every item
        item.sell_in -= 1
      end
    end
  end
end
