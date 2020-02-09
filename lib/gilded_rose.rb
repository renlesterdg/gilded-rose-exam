class GildedRose  
  def initialize(items)
    @items = items
  end

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASSES="Backstage Passes"
  SULFURAS = "Sulfuras"
  CONJURED = "Conjured"
  
  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def is_legendery item
    item.name== SULFURAS 
  end

  def is_normal item
    item.name != AGED_BRIE and item.name!=BACKSTAGE_PASSES and item.name != CONJURED and !is_legendery item
  end 
  
  def increase_quality item, value
    if !is_legendery item
      if item.quality + value <= MAX_QUALITY
        item.quality += value
      end
    end
  end

  def decrease_quality item, value
    if !is_legendery item
      if item.quality - value >=MIN_QUALITY
        item.quality -= value
      end
    end
  end

  def degrade_quality_according_to_expiry item
    if item.sell_in <=0 and is_normal item
      decrease_quality item, 2
    else
      decrease_quality item, 1      
    end
  end

  def degrade_quality_of_conjured item
    if item.sell_in <=0
      item.quality -=4
    else
      item.quality-=2
    end
  end

  def degrade_quality_of_backstage_passes item
    if item.name == BACKSTAGE_PASSES
      if item.sell_in <= 0
        item.quality =0
      elsif item.sell_in <=5
        item.quality +=3
      elsif item.sell_in >5 and item.sell_in<=10
        item.quality +=2 
        else
          item.quality +=1
        end
    end
  end

  def update_quality
    @items.each do |item|        
      if item.name == AGED_BRIE
        increase_quality item, 1
      elsif item.name == BACKSTAGE_PASSES
        degrade_quality_of_backstage_passes item
      elsif item.name == CONJURED
        degrade_quality_of_conjured item
      elsif !is_legendery item 
        item.sell_in -=1
        degrade_quality_according_to_expiry item      
      end
    end
  end
end