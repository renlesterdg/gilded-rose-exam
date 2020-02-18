Aged_Brie = "Aged Brie"
Backstage_Pass = "Backstage passes to a TAFKAL80ETC concert"
Sulfuras = "Sulfuras, Hand of Ragnaros"
Conjured = "Conjured"


# for easier compare
def normal_Item(item)
  item.name != Aged_Brie && Backstage_Pass && Sulfuras
end

def increment_Quality(item, value)
  # making sure not to exceed max value
  if item.quality + value <= 50
    item.quality = item.quality + value
  end
end

def decrement_Quality(item, value)
  # making sure not to exceed min value
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
  # check for backstage pass time
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