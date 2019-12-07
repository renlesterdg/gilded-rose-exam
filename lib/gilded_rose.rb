class GildedRose

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  CONJURED = "Conjured"

  MAXIMUM_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      $name = item.name

      case $name
      when SULFURAS
        item.quality = item.quality
      when BACKSTAGE_PASSES
        update_backstage_pases(item)
      when AGED_BRIE
        update_aged_brie(item)
      when CONJURED
        update_conjured(item)
      else
        update_normal_item(item)
      end

      if item.name != SULFURAS
        item.sell_in = item.sell_in - 1
      end

    end
  end

  def update_normal_item(item)
    if item.quality > 0 && item.sell_in < 0
      item.quality = item.quality - 2
    elsif item.quality > 0 && item.sell_in > 0
      item.quality = item.quality - 1
    end
  end

  def update_backstage_pases(item)
    if item.quality > MAXIMUM_QUALITY
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
  end

  def update_aged_brie(item)
    if item.quality < MAXIMUM_QUALITY
      item.quality = item.quality + 1        
    end
  end

  def update_conjured(item)
    if item.quality > 0 && item.sell_in < 1
      item.quality = item.quality - 4
    elsif item.quality > 0 && item.sell_in > 1
      item.quality = item.quality - 2
    end
  end

end
