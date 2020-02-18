class GildedRose

  def initialize(items)
    @items = items
  end

  Aged_Brie = "Aged Brie"
  Backstage_Pass = "Backstage passes to a TAFKAL80ETC concert"
  Sulfuras = "Sulfuras, Hand of Ragnaros"
  Conjured = "Conjured"

  def normal_Item(item)
    item.name != Aged_Brie && Backstage_Pass && Sulfuras
  end


  def increment_Quality(item, value)
    if item.quality + value <= 50
      item.quality = item.quality + value
    end
  end

  def decrement_Quality(item, value)
      if item.quality - value >= 0
        item.quality -= value
      end
  end

  def update_Aged_Brie(item)
    if item.quality < 50
      increment_Quality(item, 1)
    end
    item.sell_in -= 1
  end  
  
  def update_Backstage_Passes(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      increment_Quality(item, 3)
    elsif item.sell_in <= 10
      increment_Quality(item, 2)
    else
      increment_Quality(item, 1)
    end
    item.sell_in -= 1
  end

  def update_Normal_Item(item)
        if item.quality > 0
            if item.sell_in < 0
              decrement_Quality(item, 2)
            else
              decrement_Quality(item, 1)
            end
        end
        item.sell_in -= 1
  end

  def update_Conjured_Item(item)
    if item.quality > 0
      if item.sell_in < 0
        decrement_Quality(item, 4)
      else
        decrement_Quality(item, 2)
      end
    end
  item.sell_in -= 1
  end

  def update_quality
    @items.each do |item|
      case item.name
      when Aged_Brie
        update_Aged_Brie(item)
      when Backstage_Pass
        update_Backstage_Passes(item)
      when Sulfuras
        # do nothing
      when Conjured
        update_Conjured_Item(item)
      else
        update_Normal_Item(item)
      end
    end 
  end
end
