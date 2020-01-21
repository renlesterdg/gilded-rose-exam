AGED_BRIE = "Aged Brie"
BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
SULFURAS  = "Sulfuras, Hand of Ragnaros"

class GildedRose
  def initialize(items)
    @items = items
  end

  # to check if it is an item that degrades in quality
  def is_degrading_item(item)
    return item.name != AGED_BRIE && item.name != BACKSTAGE && item.name != SULFURAS
  end

  # to check if the quality of the item is within the boundary,
  # which is currently set between 0 to 50 exclusive.
  # If returns true, it means the quality of item is eligible to be altered
  def quality_within_boundary(item)
    return item.quality > 0 && item.quality < 50
  end

  def update_backstage(item)
    if quality_within_boundary(item)
      item.quality += 1
    end

    if item.sell_in < 11
      item.quality += 1
    end

    if item.sell_in < 6
      if item.quality < 50
        item.quality += 1
      end
    end

  end

  def update_quality
    @items.each do |item|

      if is_degrading_item(item) && quality_within_boundary(item)
        item.quality -= 1

      else
        if item.name == BACKSTAGE
          update_backstage(item)
        end
      end

      if item.name != SULFURAS
        item.sell_in = item.sell_in - 1
      end

      if item.sell_in < 0
        if item.name != AGED_BRIE
          if item.name != BACKSTAGE
            if item.quality > 0
              if item.name != SULFURAS
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

end
