class GildedRose

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != AGED_BRIE && item.name != BACKSTAGE_PASSES && item.name != SULFURAS
        update_normal_item(item)
      elsif item.name == SULFURAS
        item.quality = item.quality
      elsif item.name == BACKSTAGE_PASSES
        update_backstage_pases(item)
      elsif item.name == AGED_BRIE
        update_aged_brie(item)
      end
    end
  end
    
  def update_normal_item(item)
    item.sell_in = item.sell_in - 1
    if item.quality > 0 && item.sell_in < 0
      item.quality = item.quality - 2
    elsif item.quality > 0 && item.sell_in > 0
      item.quality = item.quality - 1
    end
  end

  def update_backstage_pases(item)
    if item.quality > 50
      item.quality = item.quality
    end
    
    if item.sell_in <= 10 && item.sell_in >= 6
      item.quality = item.quality + 2
    elsif item.sell_in <= 5 && item.sell_in >= 1
      item.quality = item.quality + 3
    elsif item.sell_in <= 0
      item.quality = item.quality - item.quality
    else
      item.quality = item.quality + 1
    end
    item.sell_in = item.sell_in - 1
  end

  def update_aged_brie(item)
    item.sell_in = item.sell_in - 1
    if item.quality < 50
      item.quality = item.quality + 1        
    end
  end

end
