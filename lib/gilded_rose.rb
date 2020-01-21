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

  # Update the quality of backstage pass before the sell_in
  def update_backstage(item)
    item.quality += 1

    if item.sell_in < 11 && quality_within_boundary(item)
      item.quality += 1
    end

    if item.sell_in < 6 && quality_within_boundary(item)
      item.quality += 1
    end
  end

  # Update quality of item.
  # This function is called BEFORE decrementing the sell_in value.
  def update_quality_before_sellin(item)
    if is_degrading_item(item)
      item.quality -= 1
    elsif item.name == BACKSTAGE
      update_backstage(item)
    elsif item.name == AGED_BRIE
      item.quality += 1
    end
  end

  # Update quality of item.
  # This function is called AFTER decrementing the sell_in value.
  def update_quality_after_sellin(item)
    if item.name == AGED_BRIE
      item.quality += 1
    elsif item.name == BACKSTAGE
      item.quality -= item.quality
    elsif item.name != SULFURAS
      item.quality -= 1
    end
  end

  # MAIN FUNCTION BEING CALLED #
  def update_quality
    @items.each do |item|

      if quality_within_boundary(item)
        update_quality_before_sellin(item)
      end

      if item.name != SULFURAS
        item.sell_in -= 1
      end

      if item.sell_in < 0 && quality_within_boundary(item)
        update_quality_after_sellin(item)
      end

    end
  end

end
